module "vpc_public_route" {
  source = "../../../../resources/aws/vpc/route"

  route_table_id = module.vpc_public_route_table.id
  gateway_id = module.vpc_igw.name
  destination_cidr_block = "0.0.0.0/0"
}