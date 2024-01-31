resource "aws_iam_user" "resource" {
  name = var.name
}

resource "aws_iam_user_group_membership" "resource" {
  user   = aws_iam_user.resource.name
  groups = var.groups
}

