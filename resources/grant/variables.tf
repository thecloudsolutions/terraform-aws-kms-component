variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "key_id" {
  type        = string
  description = "(Required) Key ID or ARN to which the grant applies. Use an ARN for a key in another account."
}

variable "name" {
  type        = string
  default     = null
  description = "(Optional) Name of the grant."
}

variable "grantee_principal" {
  type        = string
  description = "(Required) Principal allowed to perform the operations permitted by the grant."
}

variable "operations" {
  type        = set(string)
  description = "(Required) Cryptographic operations permitted by the grant."
}

variable "retiring_principal" {
  type        = string
  default     = null
  description = "(Optional) Principal allowed to retire the grant."
}

variable "retire_on_delete" {
  type        = bool
  default     = null
  description = "(Optional) Whether to retire the grant when it is removed. Defaults to false, which revokes the grant."
}

variable "grant_creation_tokens" {
  type        = set(string)
  default     = null
  sensitive   = true
  description = "(Optional) Grant tokens used when creating the grant."
}

variable "constraints" {
  type = set(object({
    encryption_context_equals = optional(map(string))
    encryption_context_subset = optional(map(string))
  }))
  default     = null
  description = "(Optional) Encryption context constraints. At most one non-empty equals or subset constraint is supported."
}
