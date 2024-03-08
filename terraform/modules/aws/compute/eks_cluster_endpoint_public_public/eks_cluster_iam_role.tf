module "eks_cluster_iam_role" {
  source             = "../../../../resources/aws/iam/role"
  name               = "${var.prefix}-iam-role-${var.eks_cluster_params.name}-${var.suffix}"
  assume_role_policy = module.eks_cluster_iam_policy_documents.json
}