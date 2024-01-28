output "secret_value" {
  value = data.aws_secretsmanager_secret_version.datasource.secret_string
}
