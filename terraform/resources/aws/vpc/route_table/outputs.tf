output "id" {
  value       = aws_route_table.resource.id
  sensitive   = true
  description = "VPC RTB 고유 식별용 ID"
}
