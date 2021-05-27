provider "aws" {
  alias  = "stanley-env"
  region = var.region

}
data "aws_ssm_parameter" "linux" {
  provider = aws.stanley-env
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

module "stanley-s3" {
    source = "./module/s3"
    region = var.region
}

module "stanley-vpc" {
  source = "./module/vpc"
  region = var.region
}

resource "aws_instance" "stanley-web" {
  provider      = aws.stanley-env
  ami           = data.aws_ssm_parameter.linux.value
  subnet_id     = module.stanley-vpc.subnet-id
  instance_type = "t2.micro"
  count         = terraform.workspace == "default" ? 1 : 2
  depends_on = [module.stanley-s3]
  
  tags = {
    Name = "${terraform.workspace}-stanley-web"
  }
}