output "name" {
  value       = aws_internet_gateway.resource.id
  sensitive   = true
  description = "aws_internet_gateway.resource.id"
}
