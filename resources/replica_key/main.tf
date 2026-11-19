resource "aws_kms_replica_key" "this" {
  region                             = var.region
  primary_key_arn                    = var.primary_key_arn
  description                        = var.description
  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.deletion_window_in_days
  enabled                            = var.enabled

  tags = var.tags
}
