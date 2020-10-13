#! /bin/sh

cp /vagrant/deployment_interfaces /etc/network/interfaces
cp /vagrant/hosts /etc/hosts
cp /vagrant/grub /etc/default/grub

update-grub

apt update -y
apt upgrade -y

apt-get install python3-dev libffi-dev gcc libssl-dev

apt install -y python-jinja2 python-pip libssl-dev
apt install -y lvm2 thin-provisioning-tools curl vim


apt-get install python3-pip
pip install -U pip

mkdir -p /home/vagrant/kolla
cp /vagrant/globals.yml /home/vagrant/kolla
cp /vagrant/run-kolla.sh /home/vagrant/kolla
cp /vagrant/init-runonce /home/vagrant/kolla
cp /vagrant/multinode /home/vagrant/kolla

reboot
