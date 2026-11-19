variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "primary_key_arn" {
  type        = string
  description = "(Required) ARN of the multi-Region primary key to replicate in a different Region."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the KMS key."
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
  description = "(Optional) Whether the replica key is enabled. Defaults to true."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to the resource."
}
