---
layout: post
title:  "Automatically clear the render cache when templates change"
date:   2017-05-11 00:00:00
comments: true
categories:
  - git
aliases:
  - /git/2017/05/11/clear-render-cache-on-template-changes.html
---
Recently someone asked whether we can disable CSS/JS aggregation and render cache on local development sites. It is totally easy to do that, but we realized that keeping render cache enabled is important to not miss caching issues during development and then have issues once the site is deployed.

On the other hand its quite annoying to have to clear the render cache manually, everytime you touch any template.

As solution we have written a script which invalidates the render cache when someone touches a template.

## Show me the code!!

We used a tool which listens to changes in the file system.
Everytime a file changes we call a script, which then clears the render cache.

Required steps to set it up:

* Install fswatch 
{{< highlight bash >}}
  brew install fswatch
{{< / highlight >}}
* Add a php helper script:
{{< highlight php >}}
<?php

/**
 * @file
 * This file invalidates render cache if any html.twig file is touched.
 */

use Drupal\Core\DrupalKernel;
use Symfony\Component\HttpFoundation\Request;

// Safeguard against any access via the webserver.
if (php_sapi_name() !== 'cli') {
  exit(1);
}

if (count($argv) > 0) {
  $basename = basename($argv[1]);
  if (strpos($basename, 'html.twig') !== FALSE) {

    // Bootstrap Drupal.
    $autoloader = require_once __DIR__ . '/../../web/autoload.php';

    $kernel = DrupalKernel::createFromRequest(Request::createFromGlobals(), $autoloader, 'prod', TRUE);
    $kernel->boot();

    // Clear the render cache.
    /** @var \Drupal\Core\Cache\CacheTagsInvalidatorInterface $cache_invalidator */
    $cache_invalidator = $kernel->getContainer()->get('cache_tags.invalidator');
    $cache_invalidator->invalidateTags(['rendered']);

    print "File {$basename} changed; render cache cleared.";
  }
}
else {
  print "File argument needed";
  exit(1);
}

{{< / highlight >}}
* Actually listen to filesystem events:
{{< highlight bash >}}
fswatch -0 . | xargs -0 -I {} -t sh -c 'php scripts/name/template-render-invalidator.php {}'
{{< / highlight >}}
* For some extra goodness place this in a composer script.

Have you done anything similar and maybe solved it different?
