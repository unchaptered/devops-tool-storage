resource "aws_iam_role_policy_attachment" "resource" {
  policy_arn = var.policy_arn
  role       = var.role_name
}