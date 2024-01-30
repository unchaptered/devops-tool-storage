resource "aws_iam_policy" "resource" {
  name        = var.policy_name        # "example-policy"
  description = var.policy_description # "Example IAM Policy"
  policy      = jsonencode(var.policy_value)
}

resource "aws_iam_user_policy_attachment" "resource" {
  user       = var.iam_user_name # aws_iam_user.example_user.name
  policy_arn = aws_iam_policy.resource.arn
}
