provider "aws" {
    region = var.region
}

resource "aws_vpc" "stanley-vpc" {
    cidr_block = var.vpc-cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      "Name" = "stanley-vpc"
    }
}

resource "aws_subnet" "stanley-subnet" {
    vpc_id = aws_vpc.stanley-vpc.id
    cidr_block = var.subnet-cidr
    map_public_ip_on_launch = true
    tags = {
      "Name" = "stanley-subnet"
    }
}