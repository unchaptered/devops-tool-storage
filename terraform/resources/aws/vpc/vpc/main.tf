resource "aws_vpc" "resource" {
  cidr_block = var.cidr_block
  tags       = var.tags
}
