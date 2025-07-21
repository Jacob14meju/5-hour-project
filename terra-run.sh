#!bin/bash

set -e

terraform init
terraform validate 
if ! terraform plan -out=tfplan.out; then
    echo "Terraform plan failed."
fi

if ! terraform apply -auto-approve tfplan.out; then
    echo "Terraform apply failed."
fi
terraform output -json > terraform_output.json
echo "Terraform output saved to terraform_output.json"
# This script initializes Terraform, validates the configuration, plans the deployment, applies it automatically, and saves the output to a JSON file.
# Make sure to run this script in the directory where your Terraform configuration files are located.
# You can run this script by executing `bash terra-run.sh`
# Ensure you have the necessary permissions and that your AWS credentials are configured correctly.