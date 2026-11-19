resource "aws_kms_external_key" "this" {
  region                             = var.region
  description                        = var.description
  key_spec                           = var.key_spec
  key_usage                          = var.key_usage
  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.deletion_window_in_days
  enabled                            = var.enabled
  key_material_base64                = var.key_material_base64
  multi_region                       = var.multi_region
  valid_to                           = var.valid_to

  tags = var.tags
}
