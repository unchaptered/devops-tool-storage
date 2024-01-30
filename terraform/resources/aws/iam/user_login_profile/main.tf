resource "aws_iam_user_login_profile" "resource" {
  user                    = var.user
  password_reset_required = var.password_reset_required
}
