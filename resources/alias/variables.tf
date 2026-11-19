variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "name" {
  type        = string
  default     = null
  description = "(Optional) The display name of the alias. The name must start with the word \"alias\" followed by a forward slash (alias/)"
}

variable "name_prefix" {
  type        = string
  default     = null
  description = "(Optional) Creates an unique alias beginning with the specified prefix. The name must start with the word \"alias\" followed by a forward slash (alias/). Conflicts with name."
}

variable "target_key_id" {
  type        = string
  description = "(Required) Identifier for the key for which the alias is for, can be either an ARN or key_id."
}
