#!/bin/bash

sudo su

apt update
adduser user1
echo "singhsaini" | passwd –-stdin "user1"

echo "user1 ALL=(ALL) NOPASSWD :ALL" >> /etc/sudoers

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes' /etc/ssh/sshd_config

systemctl restart sshd
