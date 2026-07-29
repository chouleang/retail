output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "The List of public subnet IDS"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "The List of private subnet IDS"
}

output "public_subnet_map" {
  value       = module.vpc.public_subnet_map
  description = "Map of AZ to Public Subnet ID"
}