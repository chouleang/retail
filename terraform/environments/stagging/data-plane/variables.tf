variable "aws_region" {
  type = string
}
variable "environment_name" {
  type = string
}
variable "business_division" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "rds_backup_retention_period" {
  type = number
}
variable "rds_skip_final_snapshot" {
  type = bool
}
variable "rds_deletion_protection" {
  type = bool
}
variable "rds_multi_az" {
  type = bool
}
variable "rds_mysql_instance_class" {
  type = string
}
variable "rds_postgres_instance_class" {
  type = string
}