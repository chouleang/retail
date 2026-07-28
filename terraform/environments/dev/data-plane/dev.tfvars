aws_region        = "us-east-1"
environment_name  = "dev"
business_division = "retail"
tags = {
  Terraform   = "true"
  Project     = "retail"
  Environment = "dev"
}
rds_backup_retention_period = 1
rds_skip_final_snapshot     = true
rds_deletion_protection     = false
rds_multi_az                = false
rds_mysql_instance_class    = "db.t3.micro"
rds_postgres_instance_class = "db.t3.micro"