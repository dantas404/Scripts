#!/bin/bash

sudo apt-get update -y

echo "Installing Git..."
sudo apt-get install git -y

echo "Installing VirtualBox..."

deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian jammy contrib
sudo gpg --dearmor oracle_vbox_2016.asc --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
sudo apt-get update -y
sudo apt-get install virtualbox-6.1 -y

echo "Installing Vagrant..."

sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y && sudo apt install vagrant -y

echo "Installing Vagrant plugins..."
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-triggers

echo "Clone the Vagrant OpenStack repository..."
git clone https://github.com/OpenStackCookbook/vagrant-openstack
cd vagrant-openstack
vagrant up

echo "Done! You can now run 'vagrant ssh' to connect to the VM."
