resource "aws_route53_record" "aws_route53_record_module" {
  zone_id = var.zone_id     # ""
  name    = var.record_name # "name"

  # A CASE
  type    = var.type # "A"
  ttl     = var.ttl
  records = var.records

  # B CASE
  dynamic "alias" {
    for_each = var.aliases

    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }
}
