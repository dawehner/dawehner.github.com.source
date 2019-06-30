---
layout: post
title:  "Access inaccessible git commits"
date:   2017-05-19 00:00:00
comments: true
categories:
  - git
aliases:
  - /git/2017/05/19/access-inaccessible-commits.html
---
Note: This is mostly a personal note, but maybe helpful for others


I accidentally removed a local branch using git branch -D local-branch, but I forgot to push the last commit.

I found this on the interwebs.
{{< highlight bash >}}
git log -reflog
{{< / highlight >}}

which gets all the logs and I was able to cherry-pick from there on.
