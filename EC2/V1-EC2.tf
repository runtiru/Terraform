terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "demo-server" {
  ami           = "ami-0cbd40f694b804622"
  instance_type = "t2.micro"
  key_name      = "NCAL"
}