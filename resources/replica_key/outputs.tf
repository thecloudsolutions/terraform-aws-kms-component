output "arn" {
  value       = aws_kms_replica_key.this.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "key_id" {
  value       = aws_kms_replica_key.this.key_id
  description = "The globally unique identifier for the key."
}

output "region" {
  value       = aws_kms_replica_key.this.region
  description = "Region where the resource is managed."
}

output "policy" {
  value       = aws_kms_replica_key.this.policy
  description = "The key policy JSON document."
}

output "key_rotation_enabled" {
  value       = aws_kms_replica_key.this.key_rotation_enabled
  description = "Whether rotation is enabled for the related multi-Region keys."
}

output "key_spec" {
  value       = aws_kms_replica_key.this.key_spec
  description = "Type of key material."
}

output "key_usage" {
  value       = aws_kms_replica_key.this.key_usage
  description = "Permitted cryptographic use of the key."
}

output "enabled" {
  value       = aws_kms_replica_key.this.enabled
  description = "Whether the key is enabled."
}

output "tags_all" {
  value       = aws_kms_replica_key.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
