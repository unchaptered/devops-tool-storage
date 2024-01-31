resource "aws_iam_instance_profile" "resource" {
  name = var.name

  role = var.role
}
