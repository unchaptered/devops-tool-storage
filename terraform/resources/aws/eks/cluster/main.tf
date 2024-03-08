resource "aws_eks_cluster" "resource" {
    name = var.name
    role_arn = var.role_arn

    enabled_cluster_log_types = [ "api", "audit" ]
    vpc_config {
        # Require
        subnet_ids = var.vpc_config.subnet_ids
    
        # Optional
        security_group_ids = var.vpc_config.security_group_ids
        public_access_cidrs = var.vpc_config.public_access_cidrs
        endpoint_private_access = var.vpc_config.endpoint_private_access
        endpoint_public_access = var.vpc_config.endpoint_public_access
    }
}
