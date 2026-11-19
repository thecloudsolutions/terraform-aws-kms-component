variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "key_id" {
  type        = string
  description = "(Required) Key ID, key ARN, alias name, or alias ARN of the existing key."
}

variable "grant_tokens" {
  type        = list(string)
  default     = null
  sensitive   = true
  description = "(Optional) Grant tokens used when reading the key."
}
