output "secret_name" {
  description = "DB secret name for downstream data-plane"
  value       = module.secret_store.secret_name
}

output "secret_arn" {
  description = "DB secret ARN"
  value       = module.secret_store.secret_arn
}