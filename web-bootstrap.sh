#!/usr/bin/env bash

curl --remote-name --location https://yum.puppetlabs.com/RPM-GPG-KEY-puppet
gpg --keyid-format 0xLONG --with-fingerprint ./RPM-GPG-KEY-puppet
rpm --import RPM-GPG-KEY-puppet

yum update -y && yum upgrade -y