output "id" {
  value       = data.aws_kms_public_key.this.id
  description = "The unique identifier of the resource."
}

output "arn" {
  value       = data.aws_kms_public_key.this.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "region" {
  value       = data.aws_kms_public_key.this.region
  description = "Region where the resource is managed."
}

output "customer_master_key_spec" {
  value       = data.aws_kms_public_key.this.customer_master_key_spec
  description = "Type of key material."
}

output "encryption_algorithms" {
  value       = data.aws_kms_public_key.this.encryption_algorithms
  description = "Encryption algorithms supported by the key."
}

output "key_usage" {
  value       = data.aws_kms_public_key.this.key_usage
  description = "Permitted cryptographic use of the key."
}

output "public_key" {
  value       = data.aws_kms_public_key.this.public_key
  description = "Base64-encoded DER public key."
}

output "public_key_pem" {
  value       = data.aws_kms_public_key.this.public_key_pem
  description = "PEM-encoded public key."
}

output "signing_algorithms" {
  value       = data.aws_kms_public_key.this.signing_algorithms
  description = "Signing algorithms supported by the key."
}
