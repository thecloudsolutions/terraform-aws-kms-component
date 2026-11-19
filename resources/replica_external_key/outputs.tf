output "arn" {
  value       = aws_kms_replica_external_key.this.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "key_id" {
  value       = aws_kms_replica_external_key.this.key_id
  description = "The globally unique identifier for the key."
}

output "region" {
  value       = aws_kms_replica_external_key.this.region
  description = "Region where the resource is managed."
}

output "policy" {
  value       = aws_kms_replica_external_key.this.policy
  description = "The key policy JSON document."
}

output "key_usage" {
  value       = aws_kms_replica_external_key.this.key_usage
  description = "Permitted cryptographic use of the key."
}

output "key_state" {
  value       = aws_kms_replica_external_key.this.key_state
  description = "The current state of the key."
}

output "expiration_model" {
  value       = aws_kms_replica_external_key.this.expiration_model
  description = "Whether the imported key material expires."
}

output "valid_to" {
  value       = aws_kms_replica_external_key.this.valid_to
  description = "Expiration time of the imported key material."
}

output "enabled" {
  value       = aws_kms_replica_external_key.this.enabled
  description = "Whether the key is enabled."
}

output "tags_all" {
  value       = aws_kms_replica_external_key.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
