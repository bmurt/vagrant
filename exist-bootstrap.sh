#!/usr/bin/env bash

curl --remote-name --location https://apt.puppetlabs.com/DEB-GPG-KEY-puppet
gpg --keyid-format 0xLONG --with-fingerprint ./DEB-GPG-KEY-puppet
apt-key add DEB-GPG-KEY-puppet

apt-get update -y

# skip upgrading the following packages due to grub and sudoers requiring user interaction
apt-mark hold grub-common grub-pc grub-pc-bin grub2-common sudo

apt-get upgrade -y
