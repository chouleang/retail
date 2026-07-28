# ============================================================================
# Store all data-plane endpoints in AWS Secrets Manager
# This secret will be read by SecretProviderClass → Kubernetes Secret → Helm
# ============================================================================

resource "aws_secretsmanager_secret" "dataplane_endpoints" {
  name = "${local.name}-dataplane-endpoints"
}

resource "aws_secretsmanager_secret_version" "dataplane_endpoints_version" {
  secret_id = aws_secretsmanager_secret.dataplane_endpoints.id
  secret_string = jsonencode({
    catalog_mysql_host     = aws_db_instance.catalog_rds.address
    catalog_mysql_port     = aws_db_instance.catalog_rds.port
    catalog_mysql_db       = aws_db_instance.catalog_rds.db_name
    orders_postgres_host   = aws_db_instance.orders_postgres.address
    orders_postgres_port   = aws_db_instance.orders_postgres.port
    orders_postgres_db     = aws_db_instance.orders_postgres.db_name
    checkout_redis_host    = aws_elasticache_cluster.checkout_redis.cache_nodes[0].address
    checkout_redis_port    = aws_elasticache_cluster.checkout_redis.port
    orders_sqs_queue_url   = aws_sqs_queue.orders_sqs_queue.url
    orders_sqs_queue_name  = aws_sqs_queue.orders_sqs_queue.name
    dynamodb_table_name    = aws_dynamodb_table.items_west2.name
    dynamodb_region        = "us-west-2"
  })
}

# Output the secret name for downstream reference
output "dataplane_endpoints_secret_name" {
  description = "Name of the Secrets Manager secret containing all data-plane endpoints"
  value       = aws_secretsmanager_secret.dataplane_endpoints.name
}

output "dataplane_endpoints_secret_arn" {
  description = "ARN of the Secrets Manager secret containing all data-plane endpoints"
  value       = aws_secretsmanager_secret.dataplane_endpoints.arn
}
