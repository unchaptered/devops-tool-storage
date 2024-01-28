output "id" {
  value = data.aws_route53_zone.resource.id
}
output "host_zone_id" {
  value = data.aws_route53_zone.resource.zone_id
}
output "arn" {
  value = data.aws_route53_zone.resource.arn
}
