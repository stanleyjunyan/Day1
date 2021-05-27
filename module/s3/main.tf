provider "aws" {
  region = var.region

}

resource "aws_s3_bucket" "stanley-s3" {
  bucket   = var.bucketname
  acl      = "private"

  tags = {
    Name  = var.bucketname
  }
}