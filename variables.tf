variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "allowed_ssh_ip" {
  description = "IP address allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_instance_type" {
  description = "Instance type for public EC2"
  default     = "t2.micro"
}

variable "private_instance_type" {
  description = "Instance type for private EC2"
  default     = "t2.micro"
}