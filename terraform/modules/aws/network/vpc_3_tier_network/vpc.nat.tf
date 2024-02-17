module "vpc_nat" {
  source = "../../../../resources/aws/vpc/nat"

  subnet_id     = module.vpc_public_subnet[0].id
  allocation_id = module.vpc_nat_eip.id
  tags = var.vpc_nat_tags
  depends_on    = [moduel.vpc]
}
