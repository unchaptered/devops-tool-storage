resource "aws_route" "resource" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
  nat_gateway_id         = var.nat_gateway_id
}

