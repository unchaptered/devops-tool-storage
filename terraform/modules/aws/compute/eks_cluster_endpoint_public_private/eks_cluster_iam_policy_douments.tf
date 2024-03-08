module "eks_cluster_iam_policy_documents" {
  source = "../../../../data/aws/iam/policy_document"

  statements = [{
    effect = "Allow"
    sid = null
    condition = []
    resources = []
    principals = [{
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }]
    actions = ["sts:AssumeRole"]
  }]
}