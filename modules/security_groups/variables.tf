variable "vpc_id" {
  description = "ID of the VPC"
}

variable "allowed_ssh_ip" {
  description = "IP address allowed for SSH access"
  type        = string
}