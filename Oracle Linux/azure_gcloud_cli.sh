#!/bin/bash/

echo "Insalling Docker..."
sudo dnf update -y && sudo dnf install vim docker docker-compose python3 pip npm nodejs git  -y

echo "Installing Kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client

echo "Installing Terraform..."
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install terraform

echo "Installing Azure CLI..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm

sudo dnf install azure-cli

echo "Installing Gcloud CLI..."

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-428.0.0-linux-x86_64.tar.gz

tar -xf google-cloud-cli-428.0.0-linux-x86_64.tar.gz

./google-cloud-sdk/install.sh

gcloud components install gke-gcloud-auth-plugin

echo "Installing Openstack..."

cd /etc/yum.repos.d

sudo wget http://public-yum.oracle.com/public-yum-openstack-ol6.repo

sudo yum install -y openstack-packstack

packstack --install-hosts=127.0.0.1

echo "DONE!"
