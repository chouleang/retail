# RDS PostgreSQL Instance
resource "aws_db_instance" "orders_postgres" {
  identifier              = "${local.environment}-orders-postgres-db"
  engine                  = "postgres"
  engine_version          = "17.6"
  instance_class          = var.rds_postgres_instance_class
  allocated_storage       = 20
  max_allocated_storage   = 100
  db_subnet_group_name    = aws_db_subnet_group.rds_postgresql_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_postgresql_sg.id]

  db_name                 = "ordersdb"
  username                = local.retailstore_secret_json.username # Getting from c6_03 and AWS Secret Manager secret "retailstore-db-secret-1"
  password                = local.retailstore_secret_json.password # Getting from c6_03 and AWS Secret Manager secret "retailstore-db-secret-1"
  port                    = 5432

  multi_az                = var.rds_multi_az
  storage_encrypted       = true
  publicly_accessible     = false
  skip_final_snapshot     = var.rds_skip_final_snapshot

  backup_retention_period = var.rds_backup_retention_period
  deletion_protection     = var.rds_deletion_protection

  tags = {
    Name = "${local.name}-orders-rds-postgres"
    Environment = var.environment_name
  }
}

# Outputs for RDS endpoint and credentials
output "orders_rds_postgresql_endpoint" {
  description = "PostgreSQL RDS endpoint for Orders microservice"
  value       = aws_db_instance.orders_postgres.endpoint
}

output "orders_rds_postgresql_db_name" {
  value       = aws_db_instance.orders_postgres.db_name
}

