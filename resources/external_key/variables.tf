variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the KMS key."
}

variable "key_spec" {
  type        = string
  default     = null
  description = "(Optional) Type of key material and supported algorithms for the KMS key."
}

variable "key_usage" {
  type        = string
  default     = null
  description = "(Optional) Intended cryptographic use of the KMS key."
}

variable "policy" {
  type        = string
  default     = null
  description = "(Optional) JSON key policy document."
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  default     = null
  description = "(Optional) Whether to bypass the key policy lockout safety check. Defaults to false."
}

variable "deletion_window_in_days" {
  type        = number
  default     = null
  description = "(Optional) Waiting period before deleting the key. Must be between 7 and 30 days. Defaults to 30."
}

variable "enabled" {
  type        = bool
  default     = null
  description = "(Optional) Whether the key is enabled. Keys pending key material import cannot be enabled."
}

variable "key_material_base64" {
  type        = string
  default     = null
  sensitive   = true
  description = "(Optional) Base64-encoded key material to import. This value is stored in Terraform state. Provider 6.60.0 uses RSA-2048 OAEP-SHA256 wrapping, which limits imports to 190 bytes. Larger key material must be imported externally."
}

variable "multi_region" {
  type        = bool
  default     = null
  description = "(Optional) Whether the key is a multi-Region primary key."
}

variable "valid_to" {
  type        = string
  default     = null
  description = "(Optional) Expiration time of imported key material in RFC3339 format. Omit for key material that does not expire."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to the resource."
}
