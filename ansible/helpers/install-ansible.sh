#!/bin/bash

# This script checks for and installs ansible.
if [ ! `which ansible 2>/dev/null` ]; then
  egrep " 5" /etc/redhat-release >/dev/null 2>&1
  RC=$?
  if [ $RC -eq 0 ]; then
    # The long path to installing ansible on EL5
    sudo yum -y install epel-release
    sudo yum -y install python26 python26-crypto python26-paramiko \
       python26-PyYAML git
    curl https://bootstrap.pypa.io/get-pip.py >/tmp/get-pip.py
    sudo python2.6 /tmp/get-pip.py
    sudo pip2.6 install jinja2 >/dev/null 2>&1
    sudo yum -y install python-simplejson
    sudo pip2.6 install ansible --no-deps >/dev/null 2>&1
  elif [ `which yum 2>/dev/null` ]; then
    sudo yum -y install ansible
  elif [ `which apt-get 2>/dev/null` ]; then
    sudo apt-get -y install ansible
  else
    echo "Don't know how to install ansible on this platform"
    exit 1
  fi
fi
