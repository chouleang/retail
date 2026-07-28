variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment_name" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_newbits" {
  description = "Number of new bits to add for subnet calculation"
  type        = number
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "remotebackend" {
  description = "S3 bucket name for remote state"
  type        = string
  default     = "trfbec"
}
