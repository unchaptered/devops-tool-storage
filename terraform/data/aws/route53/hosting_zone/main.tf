data "aws_route53_zone" "datasource" {
  name = var.domain_name
}
