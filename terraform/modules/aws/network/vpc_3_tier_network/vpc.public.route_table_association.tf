module "vpc_public_route_table_assocation" {
  source = "../../../../resources/aws/vpc/route_table_association"

  count = length(module.vpc_public_subnet)

  subnet_id = module.vpc_public_subnet[count.index].id
  route_table_id = module.vpc_public_route_table.id
}