terraform {
  required_version = ">= 0.11, < 0.12"
}

provider "aws" {
  region = "us-east-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "example" {
  ami           = "ami-00dc79254d0461090"
  instance_type = "t2.micro"
  subnet_id = "subnet-08448fdd1c8ed7a84"
}
