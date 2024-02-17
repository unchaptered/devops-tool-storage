module "vpc_nat_eip" {
  source = "../../../../resources/aws/ec2/eip"
  tags   = var.vpc_nat_eip_tags
}