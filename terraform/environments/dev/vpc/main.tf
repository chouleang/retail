terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
  backend "s3" {
    bucket       = "trfbec"
    key          = "vpc/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}
module "vpc" {
  source = "../../../modules/vpc"

  environment_name = var.environment_name
  vpc_cidr         = var.vpc_cidr
  #aws_region = var.aws_region
  subnet_newbits = var.subnet_newbits
  tags           = var.tags
  #remotebackend = var.remotebackend
}