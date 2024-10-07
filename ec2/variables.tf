variable "public_instance_ami" {
  description = "AMI ID for the public EC2 instance"
  type        = string
}

variable "private_instance_ami" {
  description = "AMI ID for the private EC2 instance"
  type        = string
}

variable "public_instance_type" {
  description = "Instance type for the public EC2 instance"
  type        = string
}

variable "private_instance_type" {
  description = "Instance type for the private EC2 instance"
  type        = string
}

variable "key_pair" {
  description = "Name of the SSH key pair"
  default     = "my-ec2-key"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = list(string)
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = list(string)
}
