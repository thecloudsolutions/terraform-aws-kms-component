output "arn" {
  value       = aws_kms_alias.this.arn
  description = "The Amazon Resource Name (ARN) of the key alias."
}

output "target_key_arn" {
  value       = aws_kms_alias.this.target_key_arn
  description = "The Amazon Resource Name (ARN) of the target key identifier."
}

output "name" {
  value       = aws_kms_alias.this.name
  description = "Name of the alias."
}

output "name_prefix" {
  value       = aws_kms_alias.this.name_prefix
  description = "Prefix used to generate the alias name."
}

output "target_key_id" {
  value       = aws_kms_alias.this.target_key_id
  description = "Identifier of the key associated with the alias."
}

output "region" {
  value       = aws_kms_alias.this.region
  description = "Region where the resource is managed."
}
