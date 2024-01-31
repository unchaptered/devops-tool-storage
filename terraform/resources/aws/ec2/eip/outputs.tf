output "aws_eip_module_id" {
  value     = aws_eip.resource.id
  sensitive = true
}

output "id" {
  sensitive = true
  value     = aws_eip.resource.id
}
