data "tls_public_key" "datasource" {
  private_key_pem     = var.private_key_pem
  private_key_openssh = var.private_key_openssh
}