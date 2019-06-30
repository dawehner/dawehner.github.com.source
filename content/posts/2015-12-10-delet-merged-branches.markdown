---
layout: post
title:  "Remove all merged local branches"
date:   2015-12-10 00:00:00
categories:
  - git
aliases:
  - /git/2015/12/10/delet-merged-branches.html
---
When you use git you often create a hell lot of custom branches.
This is annoying.

With using a PR based workflow this results into proper merges, so
we can truncate those branches.


{{< highlight bash >}}
git checkout master
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
{{< / highlight >}}
