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

variable "name" {
    type = string
}
variable "role_arn" {
    type = string
    sensitive = true
}

variable "vpc_config" {
    type = object({
        subnet_ids = list(string)
        security_group_ids = list(string)
        public_access_cidrs = list(string)
        endpoint_private_access = bool
        endpoint_public_access = bool
    })

    default = {
        public_access_cidrs = ["0.0.0.0/0"]
        security_group_ids = []

        endpoint_private_access = false
        endpoint_public_access = true
    }
}