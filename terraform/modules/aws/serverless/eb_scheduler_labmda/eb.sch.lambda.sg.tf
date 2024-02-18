module "eb_sch_lambda_sg" {
  source = "../../../../resources/aws/ec2/sg"

  vpc_id = var.eb_sch_labmda_vpc_id
  name   = "${var.prefix}-ec2-sg-${var.eb_sch_module_name}-${var.suffix}"

  ingress_rules = []
  egress_rules = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]

  tags = var.eb_sch_lambda_sg_tags

}