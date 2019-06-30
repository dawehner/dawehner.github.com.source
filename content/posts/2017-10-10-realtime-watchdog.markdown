---
layout: post
title:  "Realtime watchdog powered by PHP, Drupal and Elm"
date:   2017-10-10 00:00:00
comments: true
categories:
  - elm
  - php
  - websockets
  - realtime
  - drupal
aliases:
  - /elm/php/websockets/realtime/drupal/2017/10/10/realtime-watchdog.html
---

## Motivation
For my own interest, so mostly for the sake of learning new things, I [try](https://gitlab.com/dawehner/admin_ui_elm) to implement some classical Drupal UIs in ELM.

One of them is the dblog UI.

The classical dblog UI allows you to see the latest log entries, filter and sort by them.
On top of that I wanted to actually make use of the capabilities of a modern UI:

Let's stream log entries to the browser:

<iframe width="630" height="473" src="https://youtube.com/embed/H0EINy-cYZo" frameborder="0" allowfullscreen></iframe>


## Implementation


{{< figure src="/img/debugger.jpg" title="Slack debugger" >}}

A few weeks ago a friend told me: "Do you want to know how to open the chrome debugger in slack? Just press 5 times on the icon of your team." A few minutes later we figured out how communication happens in slack:

* Sending messages is using HTTP requests to some server
* Retrieving messages is using websockets from another port

Given that having a similar architecture for log streaming seems not to be the worst idea.

### The server

In order to provide real time capabilities each client needs to keep up a websocket connection
to a server. There are great services out there like [pusher.com](https://pusher.com/), but I
wanted to experiment with my own.


The tools I'm using are based upon [reactphp](http://reactphp.org). Don't mix it up with the JS library.

The server consists of three parts:

* A HTTP server listening to incoming POST requests which push new log entries
  and stores the POST body.
{{< highlight php >}}
<?php
$server = new \React\Http\Server(function (Psr\Http\Message\ServerRequestInterface $request) use (&$my_server) {
  return new Promise(function ($resolve, $reject) use ($request, &$my_server) {
    $content = '';
    $request->getBody()->on('data', function ($data) use (&$content) {
      $content .= $data;
    });
  });
});

$socket = new React\Socket\Server(8080, $loop);
$server->listen($socket);
{{< / highlight >}}
  
* A websocket server which has a connection to every client

{{< highlight php >}}
<?php
// Actual logic of the websocket server. This is 
// what all the clients connect to.
class MyServer implements MessageComponentInterface {

  public function __construct() {
      $this->clients = [];
  }

  public function onOpen(\Ratchet\ConnectionInterface $conn) {
      $this->clients[] = $conn;
  }

  public function onClose(\Ratchet\ConnectionInterface $conn) { }

  public function onError(\Ratchet\ConnectionInterface $conn, \Exception $e) {
      $conn->close();
  }

  public function onMessage(\Ratchet\ConnectionInterface $from, $msg) { }

  public function sendMessages($message) {
    /** @var \Ratchet\WebSocket\WsConnection $client */
    foreach ($this->clients as $client) {
      $client->send($message);
    }
  }

}

// Setup code for websocket server.
$app = new Ratchet\App('localhost', 8081, '127.0.0.1', $loop);
$my_server = new MyServer();
$app->route('/test', $my_server, array('*'));
$app->route('/echo', new Ratchet\Server\EchoServer, array('*'));
{{< / highlight >}}

* Once the HTTP server retrieved the post request, we call the websocket server
  which has all connections open.

{{< highlight php >}}
<?php
$server = new \React\Http\Server(function (Psr\Http\Message\ServerRequestInterface $request) use (&$my_server) {
   // ...

    $request->getBody()->on('end', function () use ($resolve, &$content, &$my_server) {
      $response = new React\Http\Response(
        200,
        array('Content-Type' => 'text/plain'),
        "Ok\n"
      );
      $resolve($response);

      // This is the important bit.
      $my_server->sendMessages($content);
    });
{{< / highlight >}}

I start this server simply by using <code>php server.php</code>. On production you want to ensure
its running using for example supervisord.

### Drupal side

On the Drupal side we want to push every dblog entry to this server via HTTP, as this is
a really easy to use protocol as a client.
Therefore we implemented a logger, see [gitlab](https://gitlab.com/dawehner/admin_ui_elm/blob/8.x-1.x/dblog_websocket/src/Logger.php).

### Client

Browsers have good support for websockets:
Connecting a websocket in JS is relatively easy:

{{< highlight javascript >}}
(new WebSocket('ws://localhost:8081/test')).addEventListener('message', (event) => {
    console.log('Message from server ', event.data);
});
{{< / highlight >}}

For the actual client code we are using [Elm](http://elm-lang.org/), a delightful language to robust implement web apps.
I won't go into detail how this works in elm, because the [official guide](https://guide.elm-lang.org/architecture/effects/web_sockets.html) is simply well written.
The elm code can be found on [gitlab](https://gitlab.com/dawehner/admin_ui_elm/blob/8.x-1.x/elm-dblog/src/App.elm).

## Summary

I know this code is by far not production code, but it shows how much is possible with some client side logic. Do you have other ideas what could be real time?
