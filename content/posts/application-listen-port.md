+++
title = "Find out that an application is listen on a given port"
date = "2019-08-22"
draft = true
+++

## BSD/OSX

```
lsof -i | grep LISTEN | grep 3030
```
