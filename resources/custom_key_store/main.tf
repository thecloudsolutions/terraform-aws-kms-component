resource "aws_kms_custom_key_store" "this" {
  region                              = var.region
  custom_key_store_name               = var.custom_key_store_name
  custom_key_store_type               = var.custom_key_store_type
  cloud_hsm_cluster_id                = var.cloud_hsm_cluster_id
  key_store_password                  = var.key_store_password
  trust_anchor_certificate            = var.trust_anchor_certificate
  xks_proxy_connectivity              = var.xks_proxy_connectivity
  xks_proxy_uri_endpoint              = var.xks_proxy_uri_endpoint
  xks_proxy_uri_path                  = var.xks_proxy_uri_path
  xks_proxy_vpc_endpoint_service_name = var.xks_proxy_vpc_endpoint_service_name

  dynamic "xks_proxy_authentication_credential" {
    for_each = var.xks_proxy_authentication_credential != null ? [var.xks_proxy_authentication_credential] : []
    content {
      access_key_id         = xks_proxy_authentication_credential.value.access_key_id
      raw_secret_access_key = xks_proxy_authentication_credential.value.raw_secret_access_key
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
