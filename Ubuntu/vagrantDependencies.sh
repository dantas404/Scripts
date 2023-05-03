#!/bin/bash

# You need to add the following lines to your /etc/apt/sources.list file before running this script:
# deb http://fasttrack.debian.net/debian-fasttrack/ bullseye-fasttrack main contrib
# deb http://fasttrack.debian.net/debian-fasttrack/ bullseye-backports-staging main contrib

echo "Installing dependencies..."
sudo apt update -y
sudo apt install git fasttrack-archive-keyring gcc perl make kernel-devel virtualbox virtualbox-ext-pack -y

echo "Installing Vagrant..."

sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install vagrant -y
vagrant plugin install vagrant-hostmanager