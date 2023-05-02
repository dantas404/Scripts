#!/bin/bash

# You need to add the following lines to your /etc/apt/sources.list file before running this script:
# deb http://fasttrack.debian.net/debian-fasttrack/ bullseye-fasttrack main contrib
# deb http://fasttrack.debian.net/debian-fasttrack/ bullseye-backports-staging main contrib

echo "Installing Git..."
sudo apt install git -y

echo "Installing VirtualBox..."

sudo apt install fasttrack-archive-keyring -y
sudo apt update -y
sudo apt install virtualbox -y
sudo apt install virtualbox-ext-pack -y


echo "Installing Vagrant..."

sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install vagrant -y

echo "Installing Vagrant plugins..."
vagrant plugin install vagrant-hostmanager

echo "Clone the Vagrant OpenStack repository..."
git clone https://github.com/OpenStackCookbook/vagrant-openstack
cd vagrant-openstack
vagrant up

echo "Done! You can now run 'vagrant ssh' to connect to the VM."
