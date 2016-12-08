variable "ink_name" {
 description = "Identifier for resources"
}

variable "key_name" {
 description = "EC2 Key Pair"
}

variable "vpc_id" {
 description = "VPC to create instance in"
}

variable "subnet_id" {
 description = "Subnet to create instance in"
}

variable "aws_region" {
  default = "us-east-1"
}
