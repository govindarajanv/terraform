terraform {
  required_version = ">= 0.12, < 0.13"
}
provider "aws" {
  region = "us-east-1"
  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
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
resource "aws_launch_configuration" "example" {
  image_id           = "ami-04b9e92b5572fa0d1"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
}
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
