aws_region                           = "us-east-1"
environment_name                     = "dev"
business_division                    = "retail"
cluster_name                         = "retail-dev-eks"
cluster_version                      = "1.33"
cluster_service_ipv4_cidr            = "172.20.0.0/16"
cluster_endpoint_private_access      = false
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
tags = {
  Terraform   = "true"
  Project     = "retail"
  Environment = "dev"
}
node_instance_types = ["t3.medium"]
node_capacity_type  = "ON_DEMAND"
node_disk_size      = 30