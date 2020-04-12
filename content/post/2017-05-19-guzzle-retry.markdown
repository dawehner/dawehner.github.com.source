---
layout: post
title:  "Retry HTTP requests"
date:   2017-05-19 00:00:00
comments: true
categories: 
  - php
  - guzzle
aliases:
  - /php,/guzzle/2017/05/19/guzzle-retry.html
---

## Problem
As a matter of life we all learn stuff fails. This might be frame with our
favourite picture, the street in front of our house, or more likely requests to APIs.

A call to a 3rd/2nd party API can fail due to various reasons:

* The client / server is under high load, which results into a timeout potentially
* The internet routes packages weird
* Currently something along the stack is deployed
* The universe just doesn't like you for a second.

When you detect a failing request you can do many things

* You catch the error, log it and present the user a nice message
* Ideally you pass along a do not cache header, so your reverse proxy/CMS takes that into account

Still, your user doesn't see the content of the page. This might be okay when the other server is down,
but as layed out above, this might not be true.

## Solution

A common strategy is to retry for:

* 1 second
* 2 seconds
* 4 seconds
* 8 seconds
* ...

You get the idea. Its using this expotential scheme to not bombard the other server in case
its actually down.

## Solution in guzzle

Guzzle, the most common HTTP library in PHP makes this possible out of the box:

{{< highlight php >}}
<?php

require_once __DIR__ . '/vendor/autoload.php';

$handler_stack = \GuzzleHttp\HandlerStack::create();
$handler_stack->push(\GuzzleHttp\Middleware::retry(function($retry, $request, $value, $reason) {
  // If we have a value already, we should be able to proceed quickly.
  if ($value !== NULL) {
    return FALSE;
  }
  
  // Reject after 10 retries.
  return $retry < 10;
}));
{{< / highlight >}}

Note, in previous versions of this snippet we didn't checked for the value.

{{< highlight php >}}
<?php
$client = new \GuzzleHttp\Client(['handler' => $handler_stack]);

$client->get('http://google.com');
{{< / highlight >}}
