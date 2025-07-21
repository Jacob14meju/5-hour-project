# This file contains Terraform variables for AWS infrastructure deployment.


variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default = "us-east-2"
validation {
  condition     = contains(["us-east-2"], var.aws_region)
    error_message = "The AWS region must be us-east-1."
}  
}


variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  validation {
    condition     = contains(["ami-0150ccaf51ab55a51", "ami-0af9b40b1a16fe700"], var.ami_id)
    error_message = "The AMI ID must be ami-0150ccaf51ab55a51"
  }
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  validation {
    condition     = contains(["t2.micro", "t2.medium"], var.instance_type)
    error_message = "The instance type must be one of t2.micro or t2.medium."
  }
  
}

#variable "availability_zone" {
 # description = "The availability zone to deploy the EC2 instance in"
 # type        = list(string)
 # default = ["us-east-2a", "us-east-2b"]
 # validation {
   # condition     = alltrue([
   #   for az in var.availability_zone :contains(["us-east-2a", "us-east-2b"], az)
  #  ])
  #  error_message = "The availability zone must be one of us-east-1a or us-east-1b."
 # }
  
#}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "tg-name" {
  description = "the name of the target group"
  type = string
}