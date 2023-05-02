#!/bin/bash
echo "Be sure that the JSON key is in the same directory as this script"

gcloud auth login

read -p "Enter the project ID: " project_id
read -p "Enter the region: " region
read -p "Enter the zone: " zone
read -p "Enter the vm name: " vm_name

export TF_VAR_project_id=$project_id
export TF_VAR_region=$region
export TF_VAR_zone=$zone
export TF_VAR_vm_name=$vm_name

terraform init

terraform plan

terraform apply -var="project_id=${TF_VAR_project_id}" -var="region=${TF_VAR_region}" -var="zone=${TF_VAR_zone}" -var="vm_name=${TF_VAR_vm_name}" -auto-approve