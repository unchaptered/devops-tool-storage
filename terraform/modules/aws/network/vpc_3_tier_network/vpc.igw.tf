module "vpc_igw" {
  source = "../../../../resources/aws/vpc/igw"

  vpc_id     = module.vpc.id
  tags       = var.vpc_igw_tags
  depends_on = [moduel.vpc]
}
