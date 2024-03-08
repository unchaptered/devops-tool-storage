module "eks_cluster" {
  source = "../../../../resources/aws/eks/cluster"

  name     = "${var.prefix}-eks-cluster-${var.eks_cluster_params.name}-${var.suffix}"
  role_arn = module.eks_cluster_iam_role.arn
  vpc_config = {
    subnet_ids          = var.eks_cluster_params.subnet_ids
    security_group_ids  = var.eks_cluster_params.security_group_ids
    public_access_cidrs = var.eks_cluster_params.public_access_cidrs

    endpoint_public_access  = true
    endpoint_private_access = true
  }
}

output "eks_cluster_endpoint" {
  value = module.eks_cluster.endpoint
}

output "eks_cluster_certificate_authority" {
  value = module.eks_cluster.certificate_authority
}