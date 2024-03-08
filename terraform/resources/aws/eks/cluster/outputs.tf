output "endpoint" {
    value = aws_eks_cluster.resource.endpoint
}

output "certificate_authority" {
    value = aws_eks_cluster.resource.certificate_authority
}