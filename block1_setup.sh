#! /bin/sh

cp /vagrant/block1_interfaces /etc/netplan/config.yaml
cp /vagrant/hosts /etc/hosts
cp /vagrant/grub /etc/default/grub

update-grub

netplan apply

apt update -y
apt upgrade -y

apt install -y python python-simplejson glances
apt install -y lvm2 thin-provisioning-tools

pvcreate /dev/sdc
vgcreate cinder-volumes /dev/sdc

echo "configfs" >> /etc/modules
update-initramfs -u
systemctl daemon-reload

reboot
