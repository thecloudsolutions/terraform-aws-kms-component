module "key" {
  source = "../resources/key"

  count = var.key != null ? 1 : 0

  region                             = var.key.region != null ? var.key.region : var.key.custom_key_store_id == null && var.key.custom_key_store_custom_name != null ? module.custom_key_store[var.key.custom_key_store_custom_name].region : null
  description                        = var.key.description
  key_usage                          = var.key.key_usage
  custom_key_store_id                = var.key.custom_key_store_id != null ? var.key.custom_key_store_id : var.key.custom_key_store_custom_name != null ? module.custom_key_store[var.key.custom_key_store_custom_name].id : null
  customer_master_key_spec           = var.key.customer_master_key_spec
  policy                             = var.key.policy
  bypass_policy_lockout_safety_check = var.key.bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.key.deletion_window_in_days
  is_enabled                         = var.key.is_enabled
  enable_key_rotation                = var.key.enable_key_rotation
  rotation_period_in_days            = var.key.rotation_period_in_days
  multi_region                       = var.key.multi_region
  xks_key_id                         = var.key.xks_key_id
  timeouts                           = var.key.timeouts

  tags = var.key.tags
}

module "external_key" {
  source = "../resources/external_key"

  count = var.external_key != null ? 1 : 0

  region                             = lookup(var.external_key, "region", null)
  description                        = lookup(var.external_key, "description", null)
  key_spec                           = lookup(var.external_key, "key_spec", null)
  key_usage                          = lookup(var.external_key, "key_usage", null)
  policy                             = lookup(var.external_key, "policy", null)
  bypass_policy_lockout_safety_check = lookup(var.external_key, "bypass_policy_lockout_safety_check", null)
  deletion_window_in_days            = lookup(var.external_key, "deletion_window_in_days", null)
  enabled                            = lookup(var.external_key, "enabled", null)
  key_material_base64                = lookup(var.external_key, "key_material_base64", null)
  multi_region                       = lookup(var.external_key, "multi_region", null)
  valid_to                           = lookup(var.external_key, "valid_to", null)

  tags = lookup(var.external_key, "tags", null)
}

module "existing_key" {
  source = "../resources/existing_key"

  count = var.existing_key != null ? 1 : 0

  region       = lookup(var.existing_key, "region", null)
  key_id       = var.existing_key.key_id
  grant_tokens = lookup(var.existing_key, "grant_tokens", null)
}

module "alias" {
  source = "../resources/alias"

  for_each = var.aliases

  region        = each.value.region != null ? each.value.region : each.value.target_key_id != null ? null : each.value.replica_key_custom_name != null ? try(module.replica_external_key[each.value.replica_key_custom_name].region, module.replica_key[each.value.replica_key_custom_name].region) : var.key != null ? module.key[0].region : var.external_key != null ? module.external_key[0].region : var.existing_key != null ? module.existing_key[0].region : null
  name          = lookup(each.value, "name", null)
  name_prefix   = lookup(each.value, "name_prefix", null)
  target_key_id = each.value.target_key_id != null ? each.value.target_key_id : each.value.replica_key_custom_name != null ? try(module.replica_external_key[each.value.replica_key_custom_name].arn, module.replica_key[each.value.replica_key_custom_name].arn) : var.key != null ? module.key[0].arn : var.external_key != null ? module.external_key[0].arn : var.existing_key != null ? module.existing_key[0].arn : null
}

module "replica_key" {
  source = "../resources/replica_key"

  for_each = var.replica_keys

  region                             = lookup(each.value, "region", null)
  primary_key_arn                    = each.value.primary_key_arn != null ? each.value.primary_key_arn : var.key != null ? module.key[0].arn : var.external_key != null ? module.external_key[0].arn : var.existing_key != null ? module.existing_key[0].arn : null
  description                        = lookup(each.value, "description", null)
  policy                             = lookup(each.value, "policy", null)
  bypass_policy_lockout_safety_check = lookup(each.value, "bypass_policy_lockout_safety_check", null)
  deletion_window_in_days            = lookup(each.value, "deletion_window_in_days", null)
  enabled                            = lookup(each.value, "enabled", null)

  tags = lookup(each.value, "tags", null)
}

module "replica_external_key" {
  source = "../resources/replica_external_key"

  for_each = var.replica_external_keys

  region                             = lookup(each.value, "region", null)
  primary_key_arn                    = each.value.primary_key_arn != null ? each.value.primary_key_arn : var.key != null ? module.key[0].arn : var.external_key != null ? module.external_key[0].arn : var.existing_key != null ? module.existing_key[0].arn : null
  description                        = lookup(each.value, "description", null)
  policy                             = lookup(each.value, "policy", null)
  bypass_policy_lockout_safety_check = lookup(each.value, "bypass_policy_lockout_safety_check", null)
  deletion_window_in_days            = lookup(each.value, "deletion_window_in_days", null)
  enabled                            = lookup(each.value, "enabled", null)
  key_material_base64                = lookup(each.value, "key_material_base64", null)
  valid_to                           = lookup(each.value, "valid_to", null)

  tags = lookup(each.value, "tags", null)
}

module "grant" {
  source = "../resources/grant"

  for_each = var.grants

  region                = each.value.region != null ? each.value.region : each.value.key_id != null ? null : each.value.replica_key_custom_name != null ? try(module.replica_external_key[each.value.replica_key_custom_name].region, module.replica_key[each.value.replica_key_custom_name].region) : var.key != null ? module.key[0].region : var.external_key != null ? module.external_key[0].region : var.existing_key != null ? module.existing_key[0].region : null
  key_id                = each.value.key_id != null ? each.value.key_id : each.value.replica_key_custom_name != null ? try(module.replica_external_key[each.value.replica_key_custom_name].arn, module.replica_key[each.value.replica_key_custom_name].arn) : var.key != null ? module.key[0].arn : var.external_key != null ? module.external_key[0].arn : var.existing_key != null ? module.existing_key[0].arn : null
  name                  = lookup(each.value, "name", null)
  grantee_principal     = each.value.grantee_principal
  operations            = each.value.operations
  retiring_principal    = lookup(each.value, "retiring_principal", null)
  retire_on_delete      = lookup(each.value, "retire_on_delete", null)
  grant_creation_tokens = lookup(each.value, "grant_creation_tokens", null)
  constraints           = lookup(each.value, "constraints", null)
}

module "key_policy" {
  source = "../resources/key_policy"

  count = var.key_policy != null ? 1 : 0

  region                             = var.key_policy.region != null ? var.key_policy.region : var.key_policy.key_id != null ? null : var.key != null ? module.key[0].region : var.external_key != null ? module.external_key[0].region : var.existing_key != null ? module.existing_key[0].region : null
  key_id                             = var.key_policy.key_id != null ? var.key_policy.key_id : var.key != null ? module.key[0].key_id : var.external_key != null ? module.external_key[0].id : var.existing_key != null ? module.existing_key[0].id : null
  policy                             = var.key_policy.policy
  bypass_policy_lockout_safety_check = lookup(var.key_policy, "bypass_policy_lockout_safety_check", null)
}

module "custom_key_store" {
  source = "../resources/custom_key_store"

  for_each = var.custom_key_stores

  region                              = lookup(each.value, "region", null)
  custom_key_store_name               = each.value.custom_key_store_name
  custom_key_store_type               = lookup(each.value, "custom_key_store_type", null)
  cloud_hsm_cluster_id                = lookup(each.value, "cloud_hsm_cluster_id", null)
  key_store_password                  = lookup(each.value, "key_store_password", null)
  trust_anchor_certificate            = lookup(each.value, "trust_anchor_certificate", null)
  xks_proxy_authentication_credential = lookup(each.value, "xks_proxy_authentication_credential", null)
  xks_proxy_connectivity              = lookup(each.value, "xks_proxy_connectivity", null)
  xks_proxy_uri_endpoint              = lookup(each.value, "xks_proxy_uri_endpoint", null)
  xks_proxy_uri_path                  = lookup(each.value, "xks_proxy_uri_path", null)
  xks_proxy_vpc_endpoint_service_name = lookup(each.value, "xks_proxy_vpc_endpoint_service_name", null)
  timeouts                            = lookup(each.value, "timeouts", null)
}

module "public_key" {
  source = "../resources/public_key"

  count = var.public_key != null ? 1 : 0

  region       = var.public_key.region != null ? var.public_key.region : var.public_key.key_id != null ? null : var.public_key.replica_key_custom_name != null ? try(module.replica_external_key[var.public_key.replica_key_custom_name].region, module.replica_key[var.public_key.replica_key_custom_name].region) : var.key != null ? module.key[0].region : var.external_key != null ? module.external_key[0].region : var.existing_key != null ? module.existing_key[0].region : null
  key_id       = var.public_key.key_id != null ? var.public_key.key_id : var.public_key.replica_key_custom_name != null ? try(module.replica_external_key[var.public_key.replica_key_custom_name].arn, module.replica_key[var.public_key.replica_key_custom_name].arn) : var.key != null ? module.key[0].arn : var.external_key != null ? module.external_key[0].arn : var.existing_key != null ? module.existing_key[0].arn : null
  grant_tokens = lookup(var.public_key, "grant_tokens", null)
}
