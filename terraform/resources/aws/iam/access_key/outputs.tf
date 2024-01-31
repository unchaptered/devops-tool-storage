output "access_key" {
  sensitive = true
  value     = aws_iam_access_key.resource.id
}
output "secret_access_key" {
  sensitive = true
  value     = aws_iam_access_key.resource.secret
}
