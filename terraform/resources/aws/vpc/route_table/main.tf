resource "aws_route_table" "resource" {
  vpc_id = var.vpc_id
  tags   = var.tags
}
