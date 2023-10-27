terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "NVIA"
}

#Provider
provider "aws" {
  region = "us-west-1"
}

#Resources
resource "aws_instance" "demo-server" {
  ami           = "ami-0cbd40f694b804622"
  instance_type = "t2.micro"
  key_name      = "NCAL"
}

#Security_groups
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Allow SSH"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}