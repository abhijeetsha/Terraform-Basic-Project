# Key Pair (Login)
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

# VPC & Security Groups
resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "This will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "automate-sg"
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "terraform-abhi"
  }
}

