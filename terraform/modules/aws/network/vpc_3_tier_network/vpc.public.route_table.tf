module "vpc_public_route_table" {
  source = "../../../../resources/aws/vpc/route_table"

  vpc_id = module.vpc.id
  tags = {}
}