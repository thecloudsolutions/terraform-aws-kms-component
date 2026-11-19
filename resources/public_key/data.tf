data "aws_kms_public_key" "this" {
  region       = var.region
  key_id       = var.key_id
  grant_tokens = var.grant_tokens
}
