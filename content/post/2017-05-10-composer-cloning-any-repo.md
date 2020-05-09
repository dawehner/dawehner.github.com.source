---
layout: post
title: "Clone a non composer repo with composer"
date:   2017-05-10 00:00:00
comments: true
categories:
  - composer
  - git
aliases:
  - /composer/git/2017/05/10/composer-cloning-any-repo.html
---
There are some usecases where you want to integrate arbitrary libraries into your system.
One example I stumbled upon was some NPM library which stored some general taxonomy mappings in json files.
In Drupal we wanted to synchronize these information.

Therefore we are using this small little bit in composer.json:

{{< highlight javascript >}}
{
    "repositories": [
        {
           "type": "package",
           "package": {
                "name": "namespace/name",
                "version": "dev-master",
                "source": {
                    "url": "https://github.com/example/example-repo.git",
                    "type": "git",
                    "reference": "master"
                }
            }
        }
    ]
}
{{< / highlight >}}

Once this is done you can use:

{{< highlight bash >}}
composer require namespace/name
{{< / highlight >}}

And well this is all you need to know. Pratically you basically specify the composer.json information inside another composer.json file.
