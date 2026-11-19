variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) The description of the key as viewed in AWS console."
}

variable "key_usage" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Specifies the intended use of the key. Valid values are ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC. Defaults to ENCRYPT_DECRYPT."
}

variable "custom_key_store_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) ID of the KMS Custom Key Store where the key will be stored instead of KMS."
}

variable "customer_master_key_spec" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption or signing algorithms that the key supports. Defaults to SYMMETRIC_DEFAULT."
}

variable "policy" {
  type        = string
  default     = null
  description = "(Optional) A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used. For more information about building policy documents with Terraform, see the AWS IAM Policy Document Guide."
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  default     = null
  description = "(Optional) A flag to indicate whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately. For more information, refer to the scenario in the Default Key Policy section in the AWS Key Management Service Developer Guide. The default value is false."
}

variable "deletion_window_in_days" {
  type        = number
  default     = null
  description = "(Optional) The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately."
}

variable "is_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
}

variable "enable_key_rotation" {
  type        = bool
  default     = null
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to false."
}

variable "rotation_period_in_days" {
  type        = number
  default     = null
  description = "(Optional) Custom period of time between each key rotation date. Must be between 90 and 2560 days. Requires enable_key_rotation."
}

variable "multi_region" {
  type        = bool
  default     = null
  description = "(Optional) Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false."
}

variable "xks_key_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Identifies the external key that serves as key material for the KMS key in an external key store. Requires custom_key_store_id."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to all modules."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    # Default 2 minutes
  })
  default     = null
  description = "(Optional) Timeouts for the service."
}
