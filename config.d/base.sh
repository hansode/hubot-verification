#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...

user=${user:-vagrant}

# redis

service redis start

# hubot

npm install -g coffee-script hubot
npm install -g yo generator-hubot
type -P hubot

su - ${user} -c "bash -ex" <<'EOS'
  if ! [[ -d mybot ]]; then
    mkdir -p mybot
    cd mybot
    if [[ -f /vagrant/hubot.conf ]]; then
      . /vagrant/hubot.conf
    fi
    yo hubot \
     --adapter="${HUBOT_ADAPTER:-"hipchat"}" \
     --owner="${HUBOT_OWNER:-"hubot-verification"}" \
     --description="${HUBOT_DESCRIPTION:-"hubot-verification"}" \
     <<< "Y"
  fi
EOS
