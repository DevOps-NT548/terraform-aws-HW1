data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "public" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.public_instance_type
  subnet_id     = var.public_subnet_id

  vpc_security_group_ids = [var.public_sg_id]

  associate_public_ip_address = true

  tags = {
    Name = "Public EC2 Instance"
  }
}

resource "aws_instance" "private" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.private_instance_type
  subnet_id     = var.private_subnet_id

  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "Private EC2 Instance"
  }
}