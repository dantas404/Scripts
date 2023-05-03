#!/bin/bash

sudo yum update -y

sudo yum groupinstall 'Development Tools' -y

sudo yum install git gcc perl make kernel-devel nfs-utils -y

sudo yum install https://download.virtualbox.org/virtualbox/7.0.8/VirtualBox-7.0-7.0.8_156879_el8-1.x86_64.rpm -y

sudo yum install https://releases.hashicorp.com/vagrant/2.3.4/vagrant-2.3.4-1.x86_64.rpm -y

vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-cachier

git clone https://github.com/bcwaldon/vagrant_devstack.git
cd vagrant_devstack/
vagrant up