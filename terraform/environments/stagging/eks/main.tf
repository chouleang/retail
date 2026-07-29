terraform {
  required_version = ">=1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
  backend "s3" {
    bucket       = "trfbec"
    key          = "eks/stagging/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "trfbec"
    key    = "vpc/stagging/terraform.tfstate"
    region = "us-east-1"
  }
}
module "eks" {
  source = "../../../modules/eks"

  aws_region                           = var.aws_region
  environment_name                     = var.environment_name
  business_division                    = var.business_division
  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  tags                                 = var.tags
  node_instance_types                  = var.node_instance_types
  node_capacity_type                   = var.node_capacity_type
  node_disk_size                       = var.node_disk_size
  # VPC data
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  # amount of private nodes group 
  desired_size = var.desired_size
}