output "id" {
  value       = data.aws_kms_key.this.id
  description = "The unique identifier of the resource."
}

output "arn" {
  value       = data.aws_kms_key.this.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "region" {
  value       = data.aws_kms_key.this.region
  description = "Region where the resource is managed."
}

output "aws_account_id" {
  value       = data.aws_kms_key.this.aws_account_id
  description = "AWS account that owns the key."
}

output "cloud_hsm_cluster_id" {
  value       = data.aws_kms_key.this.cloud_hsm_cluster_id
  description = "CloudHSM cluster containing the key material."
}

output "creation_date" {
  value       = data.aws_kms_key.this.creation_date
  description = "Creation date of the key."
}

output "custom_key_store_id" {
  value       = data.aws_kms_key.this.custom_key_store_id
  description = "ID of the custom key store containing the key."
}

output "customer_master_key_spec" {
  value       = data.aws_kms_key.this.customer_master_key_spec
  description = "Type of key material."
}

output "deletion_date" {
  value       = data.aws_kms_key.this.deletion_date
  description = "Scheduled deletion date of the key."
}

output "description" {
  value       = data.aws_kms_key.this.description
  description = "Description of the key."
}

output "enabled" {
  value       = data.aws_kms_key.this.enabled
  description = "Whether the key is enabled."
}

output "expiration_model" {
  value       = data.aws_kms_key.this.expiration_model
  description = "Whether the imported key material expires."
}

output "key_manager" {
  value       = data.aws_kms_key.this.key_manager
  description = "Manager of the key."
}

output "key_spec" {
  value       = data.aws_kms_key.this.key_spec
  description = "Type of key material."
}

output "key_state" {
  value       = data.aws_kms_key.this.key_state
  description = "The current state of the key."
}

output "key_usage" {
  value       = data.aws_kms_key.this.key_usage
  description = "Permitted cryptographic use of the key."
}

output "multi_region" {
  value       = data.aws_kms_key.this.multi_region
  description = "Whether the key is a multi-Region key."
}

output "multi_region_configuration" {
  value       = data.aws_kms_key.this.multi_region_configuration
  description = "Primary and replica configuration of the multi-Region key."
}

output "origin" {
  value       = data.aws_kms_key.this.origin
  description = "Origin of the key material."
}

output "pending_deletion_window_in_days" {
  value       = data.aws_kms_key.this.pending_deletion_window_in_days
  description = "Waiting period before deleting a multi-Region primary key."
}

output "valid_to" {
  value       = data.aws_kms_key.this.valid_to
  description = "Expiration time of the imported key material."
}

output "xks_key_configuration" {
  value       = data.aws_kms_key.this.xks_key_configuration
  description = "Configuration of the external key store key."
}
