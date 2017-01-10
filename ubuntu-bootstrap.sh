#!/usr/bin/env bash

curl --remote-name --location https://apt.puppetlabs.com/DEB-GPG-KEY-puppet
gpg --keyid-format 0xLONG --with-fingerprint ./DEB-GPG-KEY-puppet
apt-key add DEB-GPG-KEY-puppet

apt-get update -y

# upgrade commented out due to grub and sudoers requiring user interaction
# apt-get upgrade -y
