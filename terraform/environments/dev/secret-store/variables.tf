variable "aws_region" {
  description = "Where to implement the resource"
  type = string
  default = "us-east-1"
}
variable "business_division" {
  description = "What type of business"
  type = string
}
variable "environment_name" {
  description = "What is the environment"
  type = string
}
