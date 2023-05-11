#!/bin/bash/

sudo yum update -y

sudo yum install java-11-openjdk java-11-openjdk-devel git pyhon3 pip genisoimage maven -y

sudo yum install https://dev.mysql.com/get/mysql80-community-release-el8-5.noarch.rpm -y

sudo yum module disable mysql -y

sudo yum update -y

sudo yum install mysql-community-server -y

cd /home/

mkdir apacheCloudStack

cd apacheCloudStack

git clone -b 4.4 https://github.com/apache/cloudstack.git
