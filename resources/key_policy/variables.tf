variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "key_id" {
  type        = string
  description = "(Required) KMS key identifier."
}

variable "policy" {
  type        = string
  description = "(Required) JSON key policy document."
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  default     = null
  description = "(Optional) Whether to bypass the key policy lockout safety check. Defaults to false."
}
