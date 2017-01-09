#!/usr/bin/env bash

curl --remote-name --location https://apt.puppetlabs.com/DEB-GPG-KEY-puppet
gpg --keyid-format 0xLONG --with-fingerprint ./DEB-GPG-KEY-puppet
apt-key add DEB-GPG-KEY-puppe

apt-get update && apt-get upgrade -y
