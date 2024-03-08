module "eks_cluster_iam_role_policy_attachment_EKSClusterPolicy" {
  source = "../../../../resources/aws/iam/role_policy_attachment"

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role_name  = module.eks_cluster_iam_role.name
}

module "eks_cluster_iam_role_policy_attachment_EKSVPCResourceController" {
  source = "../../../../resources/aws/iam/role_policy_attachment"

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role_name  = module.eks_cluster_iam_role.name
}