provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  subnet_id = "subnet-04b5df50da57b4bd3"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  associate_public_ip_address = true

  user_data = <<-EOF
              	#!/bin/bash
              	echo "Hello, World" > index.html
              	nohup busybox httpd -f -p ${var.server_port}  &
              	EOF

  tags = {
	Name = "Govindarajan"
  }
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  vpc_id = "vpc-020c6a047e111d404"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}
output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
