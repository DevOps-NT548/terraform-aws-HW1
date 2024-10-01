variable "vpc_id" {
  description = "ID of the VPC"
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
}

variable "public_sg_id" {
  description = "ID of the public security group"
}

variable "private_sg_id" {
  description = "ID of the private security group"
}

variable "public_instance_type" {
  description = "Instance type for public EC2"
}

variable "private_instance_type" {
  description = "Instance type for private EC2"
}