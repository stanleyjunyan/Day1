provider "aws" {
  region = var.region
}

module "stanley-vpc" {
  source = "../vpc"
  region = var.region
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.stanley-vpc.vpc-id

  tags = {
    Name = "cbl-igw"
  }
}