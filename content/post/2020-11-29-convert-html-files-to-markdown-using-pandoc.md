---
layout: post
title: Convert html files to markdown using pandoc
date: 2020-11-29T10:32:30.709Z
thumbnail: ""
---
You can convert html files to markdown files using a various set of tools.

Pandoc can be really useful, as its a tool being able to handle all kind of markup language and converting between them.

Here is an example converting HTML files to markdown files.

```
nix-shell -p pandoc
pandoc input.html -t markdown -f html -s -o output.md
```
