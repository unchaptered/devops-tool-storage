output "name_servers" {
  sensitive = true
  value     = aws_route53_zone.resource.name_servers
}

output "zone_id" {
  sensitive = true
  value     = aws_route53_zone.resource.zone_id
}
