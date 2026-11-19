output "key_id" {
  value       = aws_kms_key_policy.this.key_id
  description = "The globally unique identifier for the key."
}

output "region" {
  value       = aws_kms_key_policy.this.region
  description = "Region where the resource is managed."
}

output "policy" {
  value       = aws_kms_key_policy.this.policy
  description = "The key policy JSON document."
}
