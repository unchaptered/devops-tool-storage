output "address" {
  sensitive = true
  value     = aws_db_instance.resource.address
}
