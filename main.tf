module "kms" {
  source = "./module"

  for_each = var.kms_map

  key                   = lookup(each.value, "key", null)
  external_key          = lookup(each.value, "external_key", null)
  existing_key          = lookup(each.value, "existing_key", null)
  aliases               = lookup(each.value, "aliases", null)
  grants                = lookup(each.value, "grants", null)
  replica_keys          = lookup(each.value, "replica_keys", null)
  replica_external_keys = lookup(each.value, "replica_external_keys", null)
  key_policy            = lookup(each.value, "key_policy", null)
  custom_key_stores     = lookup(each.value, "custom_key_stores", null)
  public_key            = lookup(each.value, "public_key", null)
}
