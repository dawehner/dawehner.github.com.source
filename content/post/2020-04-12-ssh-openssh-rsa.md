+++
title = "Convert openssh key to RSA PEM"
date = "2020-04-12"
draft = false
categories:
  - ssh
+++

{{< highlight bash >}}
# Generate the ssh key
ssh-keygen -t rsa -b 4096 -f /tmp/key
# Convert it to pem file
ssh-keygen -p -m PEM -f /tmp/key
{{< / highlight >}}
