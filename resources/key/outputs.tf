output "arn" {
  value       = aws_kms_key.this.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "key_id" {
  value       = aws_kms_key.this.key_id
  description = "The globally unique identifier for the key."
}

output "tags_all" {
  value       = aws_kms_key.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "region" {
  value       = aws_kms_key.this.region
  description = "Region where the resource is managed."
}

output "policy" {
  value       = aws_kms_key.this.policy
  description = "The key policy JSON document."
}

output "customer_master_key_spec" {
  value       = aws_kms_key.this.customer_master_key_spec
  description = "Type of key material."
}

output "key_usage" {
  value       = aws_kms_key.this.key_usage
  description = "Permitted cryptographic use of the key."
}

output "multi_region" {
  value       = aws_kms_key.this.multi_region
  description = "Whether the key is a multi-Region key."
}

output "is_enabled" {
  value       = aws_kms_key.this.is_enabled
  description = "Whether the key is enabled."
}

output "enable_key_rotation" {
  value       = aws_kms_key.this.enable_key_rotation
  description = "Whether key rotation is enabled."
}

output "rotation_period_in_days" {
  value       = aws_kms_key.this.rotation_period_in_days
  description = "Number of days between key rotations."
}
