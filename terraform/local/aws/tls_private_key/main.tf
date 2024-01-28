resource "tls_private_key" "resource" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}
