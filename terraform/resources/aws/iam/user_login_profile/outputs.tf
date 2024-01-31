output "password" {
  sensitive = true
  value     = aws_iam_user_login_profile.resource.password
}
