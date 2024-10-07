# Public Instance
resource "aws_instance" "public_instance" {
  ami                         = var.public_instance_ami
  instance_type               = var.public_instance_type
  subnet_id                   = var.public_subnet_id[0]
  associate_public_ip_address = true
  key_name                    = var.key_pair

  vpc_security_group_ids = [aws_security_group.public_instance_sg.id]

  tags = {
    "Name" = "Public Instance"
  }
}

# Private Instance
resource "aws_instance" "private_instance" {
  ami           = var.private_instance_ami
  instance_type = var.private_instance_type
  subnet_id     = var.private_subnet_id[0]
  key_name      = var.key_pair

  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]

  tags = {
    "Name" = "Private Instance"
  }
}

# Security Group for Public Instance
resource "aws_security_group" "public_instance_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Instance SG"
  }
}

# Security Group for Private Instance
resource "aws_security_group" "private_instance_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_instance_sg.id] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Private Instance SG"
  }
}
