data "aws_secretsmanager_secret" "datasource" {
  name = var.secret_key
}

data "aws_secretsmanager_secret_version" "datasource" {
  secret_id = data.aws_secretsmanager_secret.datasource.id
}
