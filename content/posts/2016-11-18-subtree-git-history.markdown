---
layout: post
title:  "Extract a folder from a git repo into its own repo"
date:   2016-01-18 00:00:00
categories:
  - git
aliases:
  - /git/2016/01/18/subtree-git-history.html
---

Let's assume you work on some client project. After a while you realize that the nice small tool you wrote is actually reusable and can/should be shared as opensource.

Now there are a two of possiblities:

* Copy the files and give a shit about the history
* Extract the history from an existing repo.

But how would you extract a history from an existing repo?

### Extract history from existing repo.

Step 1: Clone the existing repo into a new one:

{{< highlight bash >}}
git clone existingrepo new_opensource_repo
cd new_opensource_repo
{{< / highlight >}}

Step 2: Remove every commit beside the ones in the subfolder:
{{< highlight bash >}}
git filter-branch --prune-empty --subdirectory-filter YOUR_FOLDER_NAME master
{{< / highlight >}}