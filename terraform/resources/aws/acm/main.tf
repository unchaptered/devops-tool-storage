resource "aws_acm_certificate" "resource" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  tags              = var.tags
}

