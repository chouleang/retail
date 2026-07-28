resource "random_password" "db_password" {
  length  = 16
  special = false
}
resource "aws_secretsmanager_secret" "db_secret" {
  name = "${var.business_division}-${var.environment_name}-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "dbadmin"
    password = random_password.db_password.result
  })
}