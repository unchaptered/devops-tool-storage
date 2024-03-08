variable "policy_arn" {
  type = string

  description = <<-DESCRIPTION
  
  For eks...

  - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#example-iam-role-for-eks-cluster
  - Reuqire Policy Arn : "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  - Optional Policy Arn : "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"


  DESCRIPTION
}

variable "role_name" {
    type = string
    description = "aws_iam_role.*.name"
}