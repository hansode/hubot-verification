Hubot Verification Box
=====================

Requirements
------------

+ Vagrant (>= 1.6.5)(http://www.vagrantup.com/downloads.html)
+ Platforms
  + Virtualbox (>= 4.3.22)(https://www.virtualbox.org/wiki/Downloads)
  + VMware Workstaion (>= 10)(https://www.vmware.com/go/downloadworkstation)
+ Vagrant VMware plugin if you're using vmware (http://www.vagrantup.com/vmware)

Getting Started
---------------

Create a VM.

```
$ make up
```

Connect to the VM.

```
$ vagrant ssh
```

Hubot-HipChat
-------------

Configure `hubot-hipchat.conf`.

```
laptop$ cp -pi hubot-hipchat.conf.example hubot-hipchat.conf
laptop$ vi hubot-hipchat.conf
```

```
export HUBOT_HIPCHAT_JID="<*xxx@chat.hipchat.com via https://axsh.hipchat.com/account/xmpp*>"
export HUBOT_HIPCHAT_PASSWORD="<*PASSWORD*>"
export HUBOT_LOG_LEVEL="debug"
```

Create a wrapper script.

```
vagrant$ vi hubot.sh
```

```
#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

if [[ -f /vagrant/hubot-hipchat.conf ]]; then
  . /vagrant/hubot-hipchat.conf
fi

bin/hubot "${@}"
```

```
vagrant$ chmod +x ./hubot.sh
```

Run `bin/hubot` with hipchat adapter.

```
vagrant$ ./hubot.sh -a hipchat
```

References
----------

+ https://github.com/github/hubot/blob/master/docs/README.md
+ [Hubotの導入とHipChat Adapter設定方法 - Devlog](http://kkurahar.github.io/blog/2013/10/03/hubot-hipchat/)

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
