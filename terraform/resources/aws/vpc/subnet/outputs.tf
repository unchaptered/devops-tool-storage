output "id" {
  value       = aws_subnet.resource.id
  sensitive   = true
  description = "aws_subnet.resource.id"
}
