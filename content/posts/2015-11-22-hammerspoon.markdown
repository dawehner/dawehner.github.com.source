---
layout: post
title:  "Lua for all the things on your mac v1"
date:   2015-11-22 00:00:00
categories:
  - automation
  - hammerspoon
aliases:
  - /automation/hammerspoon/2015/11/22/hammerspoon.html
---
One thing people really like about OSX is that everything works and is easy to use,
but what is easy is not necessarily the best for your particular usecase.

![Hammerspoon](http://www.hammerspoon.org/images/hammerspoon.png)

This especially becomes important when it comes down to configurability / scriptablity.
For my own purposes I use [Hammerspoon](http://www.hammerspoon.org/) which provides
Lua wrappers for quite a lot of lower level APIs, so its easy to setup things a specific way.

Just a quick list of what you can do with it:

* Define a grid layout bound to application names:
  Left the Browser, right the IDE and shell.
* Apply this grid using a shortcut
* React to changing wlan SSIDs:
  * Start your location audio device
  * Enable a VPN automatically
* Provide a shortcut to toggle apps to fullscreen

My own [variant](https://github.com/dawehner/dotfiles/blob/master/hammerspoon/init.lua) but the [Wiki](https://github.com/Hammerspoon/hammerspoon/wiki/Sample-Configurations) provides a lot of more ideas.

