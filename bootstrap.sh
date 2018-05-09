#!/bin/sh

sudo apt-get install -y ansible
cd /tmp/ || exit
wget https://github.com/arusahni/provisioning/archive/master.tar.gz -O provisioning.tar.gz
mkdir provisioning
tar xvf provisioning.tar.gz -C provisioning --strip-components 1
cd provisioning || exit
ansible-playbook --ask-become-pass "$(hostname | tr '[:upper:]' '[:lower:]')".yml
