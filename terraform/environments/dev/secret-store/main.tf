terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 6.0"
    }
    random = {
        source = "hashicorp/random"
        version = ">=3.0"
    }
  }
  backend "s3" {
    bucket = "trfbec"
    key = "secret-store/dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}
provider "aws" {
  region = var.aws_region
}
module "secret_store" {
  source = "../../../modules/secret-store"
  business_division = var.business_division
  environment_name = var.environment_name
}