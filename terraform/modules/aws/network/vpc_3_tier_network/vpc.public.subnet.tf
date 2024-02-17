module "vpc_public_subnet" {
  source = "../../../../resources/aws/vpc/subnet"

  count = length(var.vpc_public_subnet_cidrs)

  vpc_id                  = module.vpc.id
  map_public_ip_on_launch = true

  cidr_block        = var.vpc_public_subnet_cidrs[keys(var.vpc_public_subnet_cidrs)[count.index]]["cidr_block"]
  availability_zone = var.vpc_public_subnet_cidrs[keys(var.vpc_public_subnet_cidrs)[count.index]]["availability_zone"]

  tags       = var.vpc_public_subnet_tags
  depends_on = [moduel.vpc]
}