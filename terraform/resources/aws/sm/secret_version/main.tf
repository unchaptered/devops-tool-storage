resource "aws_secretsmanager_secret_version" "resource" {
  secret_id     = var.secret_id
  secret_string = var.secret_string
}
