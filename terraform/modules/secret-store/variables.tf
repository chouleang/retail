variable "business_division" {
  description = "Name of the Secrets Manager secret"
  type        = string
  default     = "retail"
}
variable "environment_name" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}