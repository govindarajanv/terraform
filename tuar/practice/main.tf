provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0bba96c31d87e65d9"
  instance_type = "t2.micro"
  subnet_id = "subnet-04b5df50da57b4bd3"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  associate_public_ip_address = true

  user_data = <<-EOF
              	#!/bin/bash
              	echo "Hello, World" > index.html
              	nohup busybox httpd -f -p 8080 &
              	EOF

  tags = {
	Name = "Govindarajan"
  }
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  vpc_id = "vpc-020c6a047e111d404"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
