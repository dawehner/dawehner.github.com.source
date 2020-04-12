---
layout: post
title:  "Quickstarting Drupal 8"
date:   2018-05-03 00:00:00
comments: true
categories:
  - drupal
aliases:
  - /drupal/2018/05/03/drupal-quick-start.html
---

Before and around Drupalcon Nashville there [was](https://www.drupal.org/project/ideas/issues/2956879) [a](https://dri.es/three-ways-we-can-improve-drupal-evaluator-experience) [lot](http://matthewgrasmick.com/compare-php-frameworks) of discussion around improving the first time experience.
Things we achieved for example is a new Drupal.org homepage with a clear focus on 3 different userstories.

One small work [we](https://www.drupal.org/project/drupal/issues/2911319) have been doing can be seen in the following video:


<iframe src="https://player.vimeo.com/video/267910793" width="640" height="386" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/267910793">Drupal quickstart</a> from <a href="https://vimeo.com/user7658757">daniel wehner</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

To summarize this video: It should be possible to start Drupal as quickly as possible:

* Download Drupal
* Execute a single command: <code>php core/scripts/drupal quick-start</code>
* Have a working Drupal opened upon a web browser automatically.

Having such a command is a big step forward.

For me there is a lot of new possibilities opened up:

* The technical evaluator experience is potentially easier now
* Installation profiles could have an easier time
* We maybe adapt this command to make the first time contribution sprints orders of magnitude easier

To try it out you need to execute the following steps:

{{< highlight bash >}}
- curl -sS https://ftp.drupal.org/files/projects/drupal-x.y.z.zip --output drupal-x.y.z.zip
- unzip drupal-x.y.z.zip
- cd /path/to/drupal-x.y.z
- php core/scripts/drupal quick-start
{{< / highlight >}}

Please leave us feedback on Drupal.org  / twitter / Slack.


PS:
This was truely a team effort:

[Chelsee](https://drupal.org/u/Chelsee)
[Chi](https://drupal.org/u/Chi)
[Mile23](https://drupal.org/u/Mile23)
[Mixologic](https://drupal.org/u/Mixologic)
[alexpott ](https://drupal.org/u/alexpott )
[andypost](https://drupal.org/u/andypost)
[borisson\_](https://drupal.org/u/borisson_)
[cashwilliams](https://drupal.org/u/cashwilliams)
[danquah](https://drupal.org/u/danquah)
[dawehner](https://drupal.org/u/dawehner)
[droffats](https://drupal.org/u/droffats)
[dsnopek](https://drupal.org/u/dsnopek)
[geerlingguy](https://drupal.org/u/geerlingguy)
[gerzenstl](https://drupal.org/u/gerzenstl)
[heddn](https://drupal.org/u/heddn)
[jonathanshaw](https://drupal.org/u/jonathanshaw)
[kim.pepper](https://drupal.org/u/kim.pepper)
[larowlan](https://drupal.org/u/larowlan)
[maxstarkenburg](https://drupal.org/u/maxstarkenburg)
[mglaman](https://drupal.org/u/mglaman)
[mradcliffe ](https://drupal.org/u/mradcliffe )
[pbirk](https://drupal.org/u/pbirk)
[phenaproxima](https://drupal.org/u/phenaproxima)
[quietone](https://drupal.org/u/quietone)
[ressa](https://drupal.org/u/ressa)
[scotty](https://drupal.org/u/scotty)
[vaplas](https://drupal.org/u/vaplas)
[yoroy](https://drupal.org/u/yoroy)
