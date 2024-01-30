resource "aws_iam_role" "resource" {
  name               = var.name # "example_role"
  assume_role_policy = jsonencode(var.assume_role_policy)

  managed_policy_arns = var.managed_policy_arns

  dynamic "inline_policy" {
    for_each = var.inline_policy_name != null ? [1] : []

    content {
      name = var.inline_policy_name
      policy = jsonencode({
        Version   = var.inline_policy_version,
        Statement = var.inline_policy_statements
      })
    }
  }

  tags = var.tags
}
