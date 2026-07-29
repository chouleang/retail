variable "aws_region" {
  type = string
}
variable "environment_name" {
  type = string
}
variable "business_division" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "cluster_version" {
  type = string
}
variable "cluster_service_ipv4_cidr" {
  type = string
}
variable "cluster_endpoint_private_access" { type = bool }
variable "cluster_endpoint_public_access" { type = bool }
variable "cluster_endpoint_public_access_cidrs" { type = list(string) }
variable "tags" { type = map(string) }
variable "node_instance_types" { type = list(string) }
variable "node_capacity_type" { type = string }
variable "node_disk_size" { type = number }
variable "desired_size" {
  type = number
  default = 1
}