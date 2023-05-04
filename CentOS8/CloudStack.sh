#!/bin/bash

sudo yum update -y

sudo yum groupinstall 'Development Tools' -y

sudo yum install wget git gcc maven python pip perl make kernel-devel nfs-utils java-1.8.0-openjdk genisoimage java-1.8.0-openjdk-devel -y

cd /tmp

sudo wget https://dev.mysql.com/get/mysql80-community-release-el8-5.noarch.rpm

sudo rpm -Uvh mysql80-community-release-el8-5.noarch.rpm

sudo yum update -y

sudo yum install mysql-server -y

sudo yum install https://releases.hashicorp.com/vagrant/2.3.4/vagrant-2.3.4-1.x86_64.rpm -y

vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-cachier

git clone -b 4.4 https://github.com/apache/cloudstack.git
cd cloudstack
mvn -Pdeveloper,systemvm clean install
mvn -Pdeveloper -pl developer -Ddeploydb
mvn -pl :cloud-client-ui jetty:run