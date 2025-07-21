# 5 hour devops project

a quick and practical devops project designed to demonstrate the use of terraform and AWS

## what this project does
-provisioning a pvc with 2 public subnets with different availabilaty zones for lod balancer
-creating a 2 EC2 instances withis the public subnets
-creating security group for the VMs

## project structure
/5 hour project/
|------main.tf.j2
|------terra-run.sh
|------validation_boto3.py
|------variables.tf
|------generate_tf.py

## how to use
-clone the repo with "https://github.com/Jacob14meju/5-hour-project.git"
-you should be in "5 hour project" directory while running
-run "python3 generate_tfpy" and provide the details
-dont forget to enter "terraform destroy" command after you done

## prerequisites
-AWS CLI installes amd configured
-terraform installed
-python installed