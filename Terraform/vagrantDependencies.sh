#!/bin/bash

sudo apt-get update -y

echo "Installing Git..."
sudo apt-get install git -y

echo "Installing VirtualBox..."

sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list" && sudo wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - && sudo apt-get update -y && sudo apt-get install virtualbox-5.0 -y

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
