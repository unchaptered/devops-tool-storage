resource "aws_vpc_endpoint" "resource" {
  vpc_id            = var.vpc_id
  subnet_ids        = var.subnet_ids
  service_name      = var.service_name
  vpc_endpoint_type = var.vpc_endpoint_type
  tags              = var.tags
}
