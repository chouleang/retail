terraform {
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
  backend "s3" {
    bucket       = "trfbec"
    key          = "data-plane/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

#data vpc output from remote state

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "trfbec"
    key    = "vpc/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "trfbec"
    key    = "eks/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "secret-store" {
  backend = "s3"
  config = {
    bucket = "trfbec"
    key    = "secret-store/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

module "data_plane" {
  source            = "../../../modules/data-plane"
  aws_region        = var.aws_region
  environment_name  = var.environment_name
  business_division = var.business_division
  tags              = var.tags

  # From VPC remote state
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  # From EKS remote state
  eks_cluster_name              = data.terraform_remote_state.eks.outputs.eks_cluster_name
  eks_cluster_id                = data.terraform_remote_state.eks.outputs.eks_cluster_id
  eks_cluster_security_group_id = data.terraform_remote_state.eks.outputs.eks_cluster_security_group_id
  # Backup & HA configuration (per environment)
  rds_backup_retention_period = var.rds_backup_retention_period
  rds_skip_final_snapshot     = var.rds_skip_final_snapshot
  rds_deletion_protection     = var.rds_deletion_protection
  rds_multi_az                = var.rds_multi_az
  rds_mysql_instance_class    = var.rds_mysql_instance_class
  rds_postgres_instance_class = var.rds_postgres_instance_class
  # From Secret Store
  db_secret_name = data.terraform_remote_state.secret-store.outputs.secret_name

}
