data "aws_acm_certificate" "datasource" {
  domain   = var.domain
  statuses = var.status # ["ISSUED"]
}
