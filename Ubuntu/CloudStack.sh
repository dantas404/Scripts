#!/bin/bash

sudo apt update -y

sudo apt install maven python pip default-jdk wget git gcc perl make build-essential linux-headers-amd64 dkms nfs-kernel-server -y
cd /tmp
sudo apt wget https://dev.mysql.com/get/mysql-apt-config_0.8.25-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update -y
sudo apt install mysql-server -y


git clone -b 4.4 https://github.com/apache/cloudstack.git
