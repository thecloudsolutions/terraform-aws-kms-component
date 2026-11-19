variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "custom_key_store_name" {
  type        = string
  description = "(Required) Unique name of the custom key store."
}

variable "custom_key_store_type" {
  type        = string
  default     = null
  description = "(Optional) Type of custom key store. Valid values are AWS_CLOUDHSM and EXTERNAL_KEY_STORE."
}

variable "cloud_hsm_cluster_id" {
  type        = string
  default     = null
  description = "(Optional) CloudHSM cluster ID for an AWS_CLOUDHSM key store."
}

variable "key_store_password" {
  type        = string
  default     = null
  sensitive   = true
  description = "(Optional) Password of the CloudHSM kmsuser for an AWS_CLOUDHSM key store."
}

variable "trust_anchor_certificate" {
  type        = string
  default     = null
  description = "(Optional) Trust anchor certificate for an AWS_CLOUDHSM key store."
}

variable "xks_proxy_authentication_credential" {
  type = object({
    access_key_id         = string
    raw_secret_access_key = string
  })
  default     = null
  sensitive   = true
  description = "(Optional) Authentication credentials for the external key store proxy."
}

variable "xks_proxy_connectivity" {
  type        = string
  default     = null
  description = "(Optional) Connectivity to the external key store proxy. Valid values are PUBLIC_ENDPOINT and VPC_ENDPOINT_SERVICE."
}

variable "xks_proxy_uri_endpoint" {
  type        = string
  default     = null
  description = "(Optional) Endpoint of the external key store proxy."
}

variable "xks_proxy_uri_path" {
  type        = string
  default     = null
  description = "(Optional) Base path of the external key store proxy API."
}

variable "xks_proxy_vpc_endpoint_service_name" {
  type        = string
  default     = null
  description = "(Optional) VPC endpoint service name. Required for VPC_ENDPOINT_SERVICE connectivity."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default     = null
  description = "(Optional) Timeouts for the service."
}
