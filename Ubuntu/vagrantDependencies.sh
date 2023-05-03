#!/bin/bash

# You need to add the following lines to your /etc/apt/sources.list file before running this script:
# deb http://fasttrack.debian.net/debian-fasttrack/ bullseye-fasttrack main contrib
# deb http://fasttrack.debian.net/debian-fasttrack/ bullseye-backports-staging main contrib

echo "Installing dependencies..."
sudo apt install fasttrack-archive-keyring -y
sudo apt update -y
sudo apt install git gcc perl make build-essential linux-headers-amd64 dkms nfs-kernel-server virtualbox-dkms virtualbox-ext-pack virtualbox -y

echo "Installing Vagrant..."

sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install vagrant -y
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-cachier
cd /home/
git clone https://github.com/bcwaldon/vagrant_devstack.git
cd vagrant_devstack/
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.248.0

vagrant up