resource "aws_kms_grant" "this" {
  region                = var.region
  key_id                = var.key_id
  name                  = var.name
  grantee_principal     = var.grantee_principal
  operations            = var.operations
  retiring_principal    = var.retiring_principal
  retire_on_delete      = var.retire_on_delete
  grant_creation_tokens = var.grant_creation_tokens

  dynamic "constraints" {
    for_each = var.constraints != null ? var.constraints : []
    content {
      encryption_context_equals = lookup(constraints.value, "encryption_context_equals", null)
      encryption_context_subset = lookup(constraints.value, "encryption_context_subset", null)
    }
  }
}
