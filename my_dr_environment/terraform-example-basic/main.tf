provider "aws" {                         
  access_key = "${var.aws_access_key}"   
  secret_key = "${var.aws_secret_key}"   
  region     = "us-east-1"               
}                                        

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "${data.aws_key_pair.deployer.key_name}"
  security_groups = ["${data.aws_security_group.sec_group.name}" ]
  tags {
    Name = "${var.instance_name}"
  }
}

variable "instance_name" {}
