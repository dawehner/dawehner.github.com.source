---
title: "Find out that an application is listen on a given port"
date: "2019-08-22"
draft: false
---

Choose one of those:

```
lsof -i | grep LISTEN | grep 3030
netstat -ltnp | grep -w ':3030'
fuser 3030
```

