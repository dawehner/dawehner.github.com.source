---
title: "Pretty print your json"
layout: post
date:   2015-10-18 09:08:31
categories:
  - REST
  - python
aliases:
  - /rest/python/2015/10/18/pretty-print-json.html
---
Due to its simplicity compared to other formats like XML, JSON these days is completly
ruling the marking of remote APIs, like REST.

Let's have a look at one small problem which occurs quite often:
{{< highlight bash >}}
curl "https://www.openthesaurus.de/synonyme/search?q=test&format=application/json"

{"metaData":{"apiVersion":"0.2","warning":"ACHTUNG: Bitte vor ernsthafter Nutzung feedback@openthesaurus.de kontaktieren, um bei API-Änderungen informiert zu werden","copyright":"Copyright (C) 2014 Daniel Naber (www.danielnaber.de)","license":"GNU LESSER GENERAL PUBLIC LICENSE Version 2.1","source":"http://www.openthesaurus.de","date":"Sun Oct 18 09:20:29 CEST 2015"},"synsets":[{"id":292,"categories":[],"terms":[{"term":"Erprobung"},{"term":"Probe"},{"term":"Prüfung"},{"term":"Test"},{"term":"Versuch"}]},{"id":4398,"categories":[],"terms":[{"term":"Kontrolle"},{"term":"Leistungsnachweis"},{"term":"Prüfung"},{"term":"Test"}]},{"id":5752,"categories":[],"terms":[{"term":"Klassenarbeit"},{"term":"Klausur"},{"term":"Lernerfolgskontrolle"},{"term":"Prüfung"},{"term":"Schularbeit"},{"term":"Schulaufgabe"},{"term":"Test"},{"term":"Arbeit","level":"umgangssprachlich"}]},{"id":9138,"categories":[],"terms":[{"term":"Experiment"},{"term":"Probelauf"},{"term":"Studie"},{"term":"Test"},{"term":"Testballon"},{"term":"Testlauf"},{"term":"Trockenlauf"},{"term":"Trockentest"},{"term":"Versuch"}]}]}⏎
{{< / highlight >}}

## Pretty print

So you are either a guru or extremly motivated to remember the open braces for your own, otherwise you need
help to read the JSON properly.
One small trick which is pretty useful with the following helper tool:

{{< highlight bash >}}
curl "https://www.openthesaurus.de/synonyme/search?q=test&format=application/json" | python -m json.tool

{
    "metaData": {
        "apiVersion": "0.2",
        "copyright": "Copyright (C) 2014 Daniel Naber (www.danielnaber.de)",
        "date": "Sun Oct 18 09:22:37 CEST 2015",
        "license": "GNU LESSER GENERAL PUBLIC LICENSE Version 2.1",
        "source": "http://www.openthesaurus.de",
        "warning": "ACHTUNG: Bitte vor ernsthafter Nutzung feedback@openthesaurus.de kontaktieren, um bei API-\u00c4nderungen informiert zu werden"
    },

...
}
{{< / highlight >}}

This comes out of the box with python.

# Colors!

Another cool package is pygmentize, which colorizes the output.
To install use
{{< highlight bash >}}
easy_install|pip|conda install  pygmentize
{{< / highlight >}}

Then you pip that at the end and you get colored output:

{{< highlight json >}}
curl "https://www.openthesaurus.de/synonyme/search?q=test&format=application/json" | python -m json.tool | pygmentize
{{< / highlight >}}


For more sophisticated usecases checkout out [Postman][postman].
