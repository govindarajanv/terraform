provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-00dc79254d0461090"
  instance_type = "t2.micro"
  subnet_id = "subnet-04b5df50da57b4bd3"

tags = {
	Name = "Govindarajan"
	}
}
