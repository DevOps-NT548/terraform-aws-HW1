provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block    = "10.0.0.0/16"
  private_subnet    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnet     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zone = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "ec2" {
  source = "./ec2"

  vpc_id                = module.vpc.vpc_id
  public_subnet_id      = module.vpc.public_subnet_id
  private_subnet_id     = module.vpc.private_subnet_id
  public_instance_ami   = "ami-032346ab877c418af"
  private_instance_ami  = "ami-0f59d29a0ef46a444"
  public_instance_type  = "m5.large"
  private_instance_type = "t2.micro"
}
