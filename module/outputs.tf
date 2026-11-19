output "key_arn" {
  value       = var.key != null ? module.key[0].arn : var.external_key != null ? module.external_key[0].arn : var.existing_key != null ? module.existing_key[0].arn : null
  description = "The Amazon Resource Name (ARN) of the key."
}

output "key_id" {
  value       = var.key != null ? module.key[0].key_id : var.external_key != null ? module.external_key[0].id : var.existing_key != null ? module.existing_key[0].id : null
  description = "The globally unique identifier for the key."
}

output "key_tags_all" {
  value       = var.key != null ? module.key[0].tags_all : var.external_key != null ? module.external_key[0].tags_all : null
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "key_region" {
  value       = var.key != null ? module.key[0].region : var.external_key != null ? module.external_key[0].region : var.existing_key != null ? module.existing_key[0].region : null
  description = "Region where the key is managed."
}

output "key_policy" {
  value       = var.key_policy != null ? module.key_policy[0].policy : var.key != null ? module.key[0].policy : var.external_key != null ? module.external_key[0].policy : null
  description = "The effective key policy JSON document."
}

output "key_spec" {
  value       = var.key != null ? module.key[0].customer_master_key_spec : var.external_key != null ? module.external_key[0].key_spec : var.existing_key != null ? module.existing_key[0].key_spec : null
  description = "Type of key material."
}

output "key_usage" {
  value       = var.key != null ? module.key[0].key_usage : var.external_key != null ? module.external_key[0].key_usage : var.existing_key != null ? module.existing_key[0].key_usage : null
  description = "Permitted cryptographic use of the key."
}

output "key_state" {
  value       = var.external_key != null ? module.external_key[0].key_state : var.existing_key != null ? module.existing_key[0].key_state : null
  description = "The current state of the key."
}

output "key_expiration_model" {
  value       = var.external_key != null ? module.external_key[0].expiration_model : var.existing_key != null ? module.existing_key[0].expiration_model : null
  description = "Whether the imported key material expires."
}

output "key_valid_to" {
  value       = var.external_key != null ? module.external_key[0].valid_to : var.existing_key != null ? module.existing_key[0].valid_to : null
  description = "Expiration time of the imported key material."
}

output "alias_arns" {
  value       = { for alias in keys(module.alias) : alias => module.alias[alias].arn }
  description = "The Amazon Resource Name (ARN) of the key alias."
}

output "alias_names" {
  value       = { for alias in keys(module.alias) : alias => module.alias[alias].name }
  description = "Names of the key aliases."
}

output "alias_name_prefixes" {
  value       = { for alias in keys(module.alias) : alias => module.alias[alias].name_prefix }
  description = "Prefixes used to generate the alias names."
}

output "alias_target_key_arns" {
  value       = { for alias in keys(module.alias) : alias => module.alias[alias].target_key_arn }
  description = "The Amazon Resource Name (ARN) of the target key identifier."
}

output "alias_target_key_ids" {
  value       = { for alias in keys(module.alias) : alias => module.alias[alias].target_key_id }
  description = "Identifiers of the keys associated with the aliases."
}

output "alias_regions" {
  value       = { for alias in keys(module.alias) : alias => module.alias[alias].region }
  description = "Regions where the aliases are managed."
}

output "grant_ids" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].grant_id }
  description = "Map of grant identifiers."
}

output "grant_tokens" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].grant_token }
  description = "Map of grant tokens."
  sensitive   = true
}

output "grant_regions" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].region }
  description = "Map of grant regions."
}

output "grant_key_ids" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].key_id }
  description = "Map of key IDs or ARNs to which the grants apply."
}

output "grant_names" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].name }
  description = "Map of grant names."
}

output "grant_grantee_principals" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].grantee_principal }
  description = "Map of grantee principals."
}

output "grant_operations" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].operations }
  description = "Map of operations permitted by the grants."
}

output "grant_retiring_principals" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].retiring_principal }
  description = "Map of retiring principals."
}

output "grant_constraints" {
  value       = { for grant in keys(module.grant) : grant => module.grant[grant].constraints }
  description = "Map of encryption context constraints for the grants."
}

output "replica_key_arns" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].arn }
  description = "The Amazon Resource Name (ARN) of the key."
}

output "replica_key_ids" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].key_id }
  description = "The globally unique identifier for the key."
}

output "replica_key_regions" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].region }
  description = "Region where the resource is managed."
}

output "replica_key_policies" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].policy }
  description = "The key policy JSON document."
}

output "replica_key_rotation_enabled" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].key_rotation_enabled }
  description = "Whether rotation is enabled for the related multi-Region keys."
}

output "replica_key_specs" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].key_spec }
  description = "Type of key material."
}

output "replica_key_usages" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].key_usage }
  description = "Permitted cryptographic use of the key."
}

output "replica_key_enabled" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].enabled }
  description = "Whether the key is enabled."
}

output "replica_key_tags_all" {
  value       = { for key in keys(module.replica_key) : key => module.replica_key[key].tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "replica_external_key_arns" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].arn }
  description = "The Amazon Resource Name (ARN) of the key."
}

output "replica_external_key_ids" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].key_id }
  description = "The globally unique identifier for the key."
}

output "replica_external_key_regions" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].region }
  description = "Region where the resource is managed."
}

output "replica_external_key_policies" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].policy }
  description = "The key policy JSON document."
}

output "replica_external_key_usages" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].key_usage }
  description = "Permitted cryptographic use of the key."
}

output "replica_external_key_states" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].key_state }
  description = "The current state of the key."
}

output "replica_external_key_expiration_models" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].expiration_model }
  description = "Whether the imported key material expires."
}

output "replica_external_key_valid_to" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].valid_to }
  description = "Expiration time of the imported key material."
}

output "replica_external_key_enabled" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].enabled }
  description = "Whether the key is enabled."
}

output "replica_external_key_tags_all" {
  value       = { for key in keys(module.replica_external_key) : key => module.replica_external_key[key].tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "custom_key_store_ids" {
  value       = { for store in keys(module.custom_key_store) : store => module.custom_key_store[store].id }
  description = "Map of custom key store identifiers."
}

output "existing_key_id" {
  value       = var.existing_key != null ? module.existing_key[0].id : null
  description = "The unique identifier of the resource."
}

output "existing_key_arn" {
  value       = var.existing_key != null ? module.existing_key[0].arn : null
  description = "The Amazon Resource Name (ARN) of the key."
}

output "existing_key_region" {
  value       = var.existing_key != null ? module.existing_key[0].region : null
  description = "Region where the resource is managed."
}

output "existing_key_aws_account_id" {
  value       = var.existing_key != null ? module.existing_key[0].aws_account_id : null
  description = "AWS account that owns the key."
}

output "existing_key_cloud_hsm_cluster_id" {
  value       = var.existing_key != null ? module.existing_key[0].cloud_hsm_cluster_id : null
  description = "CloudHSM cluster containing the key material."
}

output "existing_key_creation_date" {
  value       = var.existing_key != null ? module.existing_key[0].creation_date : null
  description = "Creation date of the key."
}

output "existing_key_custom_key_store_id" {
  value       = var.existing_key != null ? module.existing_key[0].custom_key_store_id : null
  description = "ID of the custom key store containing the key."
}

output "existing_key_customer_master_key_spec" {
  value       = var.existing_key != null ? module.existing_key[0].customer_master_key_spec : null
  description = "Type of key material."
}

output "existing_key_deletion_date" {
  value       = var.existing_key != null ? module.existing_key[0].deletion_date : null
  description = "Scheduled deletion date of the key."
}

output "existing_key_description" {
  value       = var.existing_key != null ? module.existing_key[0].description : null
  description = "Description of the key."
}

output "existing_key_enabled" {
  value       = var.existing_key != null ? module.existing_key[0].enabled : null
  description = "Whether the key is enabled."
}

output "existing_key_expiration_model" {
  value       = var.existing_key != null ? module.existing_key[0].expiration_model : null
  description = "Whether the imported key material expires."
}

output "existing_key_manager" {
  value       = var.existing_key != null ? module.existing_key[0].key_manager : null
  description = "Manager of the key."
}

output "existing_key_spec" {
  value       = var.existing_key != null ? module.existing_key[0].key_spec : null
  description = "Type of key material."
}

output "existing_key_state" {
  value       = var.existing_key != null ? module.existing_key[0].key_state : null
  description = "The current state of the key."
}

output "existing_key_usage" {
  value       = var.existing_key != null ? module.existing_key[0].key_usage : null
  description = "Permitted cryptographic use of the key."
}

output "existing_key_multi_region" {
  value       = var.existing_key != null ? module.existing_key[0].multi_region : null
  description = "Whether the key is a multi-Region key."
}

output "existing_key_multi_region_configuration" {
  value       = var.existing_key != null ? module.existing_key[0].multi_region_configuration : null
  description = "Primary and replica configuration of the multi-Region key."
}

output "existing_key_origin" {
  value       = var.existing_key != null ? module.existing_key[0].origin : null
  description = "Origin of the key material."
}

output "existing_key_pending_deletion_window_in_days" {
  value       = var.existing_key != null ? module.existing_key[0].pending_deletion_window_in_days : null
  description = "Waiting period before deleting a multi-Region primary key."
}

output "existing_key_valid_to" {
  value       = var.existing_key != null ? module.existing_key[0].valid_to : null
  description = "Expiration time of the imported key material."
}

output "existing_key_xks_key_configuration" {
  value       = var.existing_key != null ? module.existing_key[0].xks_key_configuration : null
  description = "Configuration of the external key store key."
}

output "public_key" {
  value       = var.public_key != null ? module.public_key[0].public_key : null
  description = "Base64-encoded DER public key."
}

output "public_key_pem" {
  value       = var.public_key != null ? module.public_key[0].public_key_pem : null
  description = "PEM-encoded public key."
}

output "public_key_arn" {
  value       = var.public_key != null ? module.public_key[0].arn : null
  description = "ARN of the key whose public key was retrieved."
}

output "public_key_encryption_algorithms" {
  value       = var.public_key != null ? module.public_key[0].encryption_algorithms : null
  description = "Encryption algorithms supported by the key."
}

output "public_key_signing_algorithms" {
  value       = var.public_key != null ? module.public_key[0].signing_algorithms : null
  description = "Signing algorithms supported by the key."
}
