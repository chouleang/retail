# Pass through EKS module outputs so downstream root modules (data-plane, app deployment) can read them via terraform_remote_state

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.eks_cluster_name
}

output "eks_cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.eks_cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "EKS cluster security group ID (for RDS, Redis, etc. ingress rules)"
  value       = module.eks.eks_cluster_security_group_id
}

output "eks_node_instance_role_arn" {
  description = "IAM role ARN for EKS worker nodes"
  value       = module.eks.eks_node_instance_role_arn
}

output "to_configure_kubectl" {
  description = "Command to configure kubectl"
  value       = module.eks.to_configure_kubectl
}
