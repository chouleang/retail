# Pass through data-plane module outputs for downstream use (e.g., Helm deployments, app configs)

# === Catalog (RDS MySQL) ===
output "catalog_rds_endpoint" {
  description = "RDS MySQL endpoint for Catalog microservice"
  value       = module.data_plane.catalog_rds_endpoint
}

output "catalog_rds_sg_id" {
  description = "RDS MySQL security group ID"
  value       = module.data_plane.catalog_rds_sg_id
}

# === Orders (RDS PostgreSQL) ===
output "orders_rds_postgresql_endpoint" {
  description = "RDS PostgreSQL endpoint for Orders microservice"
  value       = module.data_plane.orders_rds_postgresql_endpoint
}

output "orders_rds_postgresql_db_name" {
  description = "Database name for Orders microservice"
  value       = module.data_plane.orders_rds_postgresql_db_name
}

# === Checkout (ElastiCache Redis) ===
output "checkout_redis_endpoint" {
  description = "Redis endpoint for Checkout microservice"
  value       = module.data_plane.checkout_redis_endpoint
}

# === Orders (SQS) ===
output "orders_sqs_queue_url" {
  description = "SQS Queue URL for Orders microservice"
  value       = module.data_plane.orders_sqs_queue_url
}

output "orders_sqs_queue_arn" {
  description = "SQS Queue ARN for Orders microservice"
  value       = module.data_plane.orders_sqs_queue_arn
}

# === Pod Identity Association ARNs ===
output "catalog_sa_pod_identity_association_arn" {
  description = "Pod Identity Association ARN for Catalog service account"
  value       = module.data_plane.catalog_sa_pod_identity_association_arn
}

output "orders_postgresql_sa_pod_identity_association_arn" {
  description = "Pod Identity Association ARN for Orders service account"
  value       = module.data_plane.orders_postgresql_sa_pod_identity_association_arn
}

output "dataplane_endpoints_secret_name" {
  value = module.data_plane.dataplane_endpoints_secret_name
}
