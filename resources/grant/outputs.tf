output "id" {
  value       = aws_kms_grant.this.id
  description = "The unique identifier of the resource."
}

output "grant_id" {
  value       = aws_kms_grant.this.grant_id
  description = "The unique identifier of the grant."
}

output "grant_token" {
  value       = aws_kms_grant.this.grant_token
  description = "The grant token for the created grant."
  sensitive   = true
}

output "region" {
  value       = aws_kms_grant.this.region
  description = "Region where the resource is managed."
}

output "key_id" {
  value       = aws_kms_grant.this.key_id
  description = "Key ID or ARN to which the grant applies."
}

output "name" {
  value       = aws_kms_grant.this.name
  description = "The name of the grant."
}

output "grantee_principal" {
  value       = aws_kms_grant.this.grantee_principal
  description = "The principal allowed to perform the operations permitted by the grant."
}

output "operations" {
  value       = aws_kms_grant.this.operations
  description = "Cryptographic operations permitted by the grant."
}

output "retiring_principal" {
  value       = aws_kms_grant.this.retiring_principal
  description = "The principal allowed to retire the grant."
}

output "constraints" {
  value       = aws_kms_grant.this.constraints
  description = "Encryption context constraints for the grant."
}
