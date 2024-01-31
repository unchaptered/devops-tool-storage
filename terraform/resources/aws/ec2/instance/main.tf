resource "aws_instance" "resource" {
  ami           = var.ami
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  tags                   = var.tags

  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
}
