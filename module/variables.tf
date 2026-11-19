variable "key" {
  type = object({
    region                             = optional(string)
    description                        = optional(string)
    key_usage                          = optional(string)
    custom_key_store_id                = optional(string)
    custom_key_store_custom_name       = optional(string)
    customer_master_key_spec           = optional(string)
    policy                             = optional(string)
    bypass_policy_lockout_safety_check = optional(bool)
    deletion_window_in_days            = optional(number)
    is_enabled                         = optional(bool)
    enable_key_rotation                = optional(bool)
    rotation_period_in_days            = optional(number)
    multi_region                       = optional(bool)
    xks_key_id                         = optional(string)
    tags                               = optional(map(string))
    timeouts = optional(object({
      create = optional(string)
    }))
  })

  default = null
}

variable "external_key" {
  type = object({
    region                             = optional(string)
    description                        = optional(string)
    key_spec                           = optional(string)
    key_usage                          = optional(string)
    policy                             = optional(string)
    bypass_policy_lockout_safety_check = optional(bool)
    deletion_window_in_days            = optional(number)
    enabled                            = optional(bool)
    key_material_base64                = optional(string)
    multi_region                       = optional(bool)
    valid_to                           = optional(string)
    tags                               = optional(map(string))
  })

  default = null
}

variable "existing_key" {
  type = object({
    region       = optional(string)
    key_id       = string
    grant_tokens = optional(list(string))
  })

  default = null
}

variable "aliases" {
  type = map(object({
    region                  = optional(string)
    name                    = optional(string)
    name_prefix             = optional(string)
    target_key_id           = optional(string)
    replica_key_custom_name = optional(string)
  }))

  default = {}
}

variable "grants" {
  type = map(object({
    region                  = optional(string)
    key_id                  = optional(string)
    replica_key_custom_name = optional(string)
    name                    = optional(string)
    grantee_principal       = string
    operations              = set(string)
    retiring_principal      = optional(string)
    retire_on_delete        = optional(bool)
    grant_creation_tokens   = optional(set(string))
    constraints = optional(set(object({
      encryption_context_equals = optional(map(string))
      encryption_context_subset = optional(map(string))
    })))
  }))

  default = {}
}

variable "replica_keys" {
  type = map(object({
    region                             = optional(string)
    primary_key_arn                    = optional(string)
    description                        = optional(string)
    policy                             = optional(string)
    bypass_policy_lockout_safety_check = optional(bool)
    deletion_window_in_days            = optional(number)
    enabled                            = optional(bool)
    tags                               = optional(map(string))
  }))

  default = {}
}

variable "replica_external_keys" {
  type = map(object({
    region                             = optional(string)
    primary_key_arn                    = optional(string)
    description                        = optional(string)
    policy                             = optional(string)
    bypass_policy_lockout_safety_check = optional(bool)
    deletion_window_in_days            = optional(number)
    enabled                            = optional(bool)
    key_material_base64                = optional(string)
    valid_to                           = optional(string)
    tags                               = optional(map(string))
  }))

  default = {}
}

variable "key_policy" {
  type = object({
    region                             = optional(string)
    key_id                             = optional(string)
    policy                             = string
    bypass_policy_lockout_safety_check = optional(bool)
  })

  default = null
}

variable "custom_key_stores" {
  type = map(object({
    region                   = optional(string)
    custom_key_store_name    = string
    custom_key_store_type    = optional(string)
    cloud_hsm_cluster_id     = optional(string)
    key_store_password       = optional(string)
    trust_anchor_certificate = optional(string)
    xks_proxy_authentication_credential = optional(object({
      access_key_id         = string
      raw_secret_access_key = string
    }))
    xks_proxy_connectivity              = optional(string)
    xks_proxy_uri_endpoint              = optional(string)
    xks_proxy_uri_path                  = optional(string)
    xks_proxy_vpc_endpoint_service_name = optional(string)
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
  }))

  default = {}
}

variable "public_key" {
  type = object({
    region                  = optional(string)
    key_id                  = optional(string)
    replica_key_custom_name = optional(string)
    grant_tokens            = optional(list(string))
  })

  default = null
}
