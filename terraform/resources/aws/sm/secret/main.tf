resource "aws_secretsmanager_secret" "resource" {
  name = var.name
  tags = var.tags
}
