resource "awscc_iam_role" "awscc_iam_role_module" {
  role_name                   = var.role_name # "ChatBot-Channel-Role"
  assume_role_policy_document = jsonencode(var.assume_role_policy_document)
  managed_policy_arns         = var.managed_policy_arns
}
