#!/bin/bash/

sudo dnf update -y && sudo dnf install vim docker docker-compose python3 pip npm nodejs git  -y

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install terraform

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm

sudo dnf install azure-cli