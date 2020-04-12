---
layout: post
title:  "Create a PDF from a couple of images"
date:   2016-01-11 00:00:00
categories:
  - shell
aliases:
  - /shell/2016/01/11/create-pdf-from-images.html
---
Sometimes you just want to create a PDF from a couple of scanned document papers.
One solution could be of course to embed these pages into LibreOffice / Word and then use a PDF printer to get it.
Some people though like tools on the shell.

Therefore we can use imagemagick, which is probably already installed on your system.
It provides a command line util called `convert`.
{{< highlight bash >}}
convert first-image.png second-image.png image.png result.pdf
{{< / highlight >}}

Maybe a bit too easy.
