output "id" {
    sensitive = true
    value = aws_secretsmanager_secret.resource.id
}