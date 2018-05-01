provider "aws" {
region = "us-east-1"
access_key = "Your Access Key"
secret_key = "Your Secret Key"
}

resource "aws_vpc" "terraform-vpc" {
cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
enable_dns_support = "true"
enable_dns_hostnames = "true"
enable_classiclink = "false"
	tags {
		Name = "terraform"
	}
}

resource "aws_subnet" "public-1" {
vpc_id = "${aws_vpc.terraform-vpc.id}"
cidr_block ="10.0.1.0/24"
map_public_ip_on_launch = "true"
availability_zone = "ap-southeast-2b"
tags {
Name = "public"
}
}

resource "aws_subnet" "private-1" {
vpc_id = "${aws_vpc.terraform-vpc.id}"
cidr_block ="10.0.100.0/24"
map_public_ip_on_launch = "false"
availability_zone = "ap-southeast-2b"
tags {
Name = "private"
}
}
