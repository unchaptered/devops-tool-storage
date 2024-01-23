output "id" {
  value       = aws_vpc.resource.id
  sensitive   = true
  description = "aws_vpc.resource.id"
}
