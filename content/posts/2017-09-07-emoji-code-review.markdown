---
layout: post
title:  "Emoji code review"
date:   2017-09-08 00:00:00
comments: true
categories:
  - github
  - code review
aliases:
  - /github,/code/review/2017/09/08/emoji-code-review.html
---

## Problem
From my personal experience the hardest part of projects isn't the technical side nor the project managment side or anything like this, its communication. Communication problems leads to demotivation, hours of lost work etc.

A small subset of this space is communicating clearly in code reviews. Many people use tools like github to basically comment on bits of code, but there is no semantic meaning attached to each comment. Given that people need to extract exactly what each comment might mean. Just an example:

> This line might be better wrapped.

This example is not obvious: Do the reviewer want it to be changed, would it be nice or do they simply not care enough?

## Solution

On this german speaking [podcast](https://gist.github.com/pfleidi/4422a5cac5b04550f714f1f886d2feea) they talked about the [emoji code review](https://gist.github.com/pfleidi/4422a5cac5b04550f714f1f886d2feea).

The general idea is to have a set of emojis each representing a common type of code review response:

* 👍  I like this. Use this to motivate people. Don't overuse it, but certainly point out if you like something.
* ❓ I have a concrete question. There is nothing here to be changed yet.
* ❌  Here is an actual problem. Please change this according to my suggestion. It might be a bug or a strict code style fix.
* 🔧  Here is an idea/suggestion. I think it would improve things, but feel free to disagree :)
* 🙃  This is a nitpick. Feel free to change of leave it.
* 🤔  This might be wrong. Let's talk about it, maybe we can come up with a better solution
* 🤡  Here is a problem independent from your work. It would be nice if we would open up a ticket and discuss about that.

Give it a try in your next code review and link to the gist above, so people know what you meant.
At least for me being able to express meaning, given I'm not a native english speaker, gives me some level of confidence.

TL;DR
Use a standard set of emojis to represent semantic meaning in reviews.
