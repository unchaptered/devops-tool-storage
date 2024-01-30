resource "aws_iam_group_policy" "resource" {
  name  = var.name
  group = var.group

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "iam:ChangePassword",
        Resource = "*",
      },
    ],
  })
}
