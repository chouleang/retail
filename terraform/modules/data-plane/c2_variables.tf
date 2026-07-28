# --------------------------------------------------------
# AWS Region (used in provider block)
# --------------------------------------------------------
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# --------------------------------------------------------
# Environment & Business Division Info
# --------------------------------------------------------

# Logical environment name (used in tags and resource names)
variable "environment_name" {
  description = "Environment name used in resource names and tags"
  type        = string
}

# Business unit or department (used in tags and naming)
variable "business_division" {
  description = "Business Division in the large organization this infrastructure belongs to"
  type        = string
  default     = "retail"
}

# --------------------------------------------------------
# Common Tags
# --------------------------------------------------------

# Tags applied to all resources created by this configuration
variable "tags" {
  description = "Tags to apply to EKS and related resources"
  type        = map(string)
  default     = {
    Terraform = "true"
  }
}

# --------------------------------------------------------
# VPC Inputs (passed from environment root module)
# --------------------------------------------------------
variable "vpc_id" {
  description = "VPC ID where data plane resources will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS, ElastiCache, etc."
  type        = list(string)
}

# --------------------------------------------------------
# EKS Inputs (passed from environment root module)
# --------------------------------------------------------
variable "eks_cluster_name" {
  description = "Name of the EKS cluster for Pod Identity associations"
  type        = string
}

variable "eks_cluster_id" {
  description = "ID of the EKS cluster"
  type        = string
}
variable "eks_cluster_security_group_id" {
  description = "Security group ID of the EKS cluster"
  type        = string
}
variable "eks_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  type        = string
  default     = null
}

## RDS Back Up & HA Configuration
variable "rds_backup_retention_period" {
  description = "Number of days to retain backup (0-35)"
  type = number
  default = 0
}
variable "rds_skip_final_snapshot" {
  description = "Skip final snapshot when destroy DB"
  type = bool
  default = true
}
variable "rds_deletion_protection" {
  description = "Enable deletion protection"
  type = bool
  default = false
}
variable "rds_multi_az" {
  description = "Enable Multi-AZ deployment "
  type = bool
  default = false
}
variable "rds_mysql_instance_class" {
  description = "Instance class for RDS MySQL (catalog)"
  type = string
  default = "db.t3.micro"
}
variable "rds_postgres_instance_class" {
  description = "Instance class for RDS PostgresSQL (Order Service)"
  type = string
  default = "db.t3.micro"
}

### Secret for DB
variable "db_secret_name" {
  type = string
}