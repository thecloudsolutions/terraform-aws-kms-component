output "id" {
  value       = aws_kms_custom_key_store.this.id
  description = "The unique identifier of the resource."
}

output "region" {
  value       = aws_kms_custom_key_store.this.region
  description = "Region where the resource is managed."
}

output "custom_key_store_name" {
  value       = aws_kms_custom_key_store.this.custom_key_store_name
  description = "Name of the custom key store."
}

output "custom_key_store_type" {
  value       = aws_kms_custom_key_store.this.custom_key_store_type
  description = "Type of custom key store."
}
