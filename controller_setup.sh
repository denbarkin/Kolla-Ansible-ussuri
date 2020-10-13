#! /bin/sh

cp /vagrant/controller_interfaces /etc/netplan/config.yaml
cp /vagrant/hosts /etc/hosts
cp /vagrant/grub /etc/default/grub

update-grub

netplan apply

apt update -y
apt upgrade -y

apt install -y python python-simplejson glances

reboot
