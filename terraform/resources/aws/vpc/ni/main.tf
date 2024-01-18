
resource "aws_network_interface" "resource" {
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
}
