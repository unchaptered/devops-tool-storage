output "name" {
  sensitive = true
  value     = aws_db_parameter_group.resource.name
}
