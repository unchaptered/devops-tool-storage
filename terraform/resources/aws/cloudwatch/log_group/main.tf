resource "aws_cloudwatch_log_group" "resource" {
  # Reference: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
  name              = var.name
  retention_in_days = var.retention_in_days
}

variable "name" {
    type = string

    description = <<-DESCRIPTION
  
    For eks...
    - "/aws/eks/<CLUSTER_NAME>/cluster"
    - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#enabling-control-plane-logging
    
    ```tf
    resource "aws_eks_cluster" "example" {
        depends_on = [aws_cloudwatch_log_group.example]

        enabled_cluster_log_types = ["api", "audit"]
        name                      = var.cluster_name

        # ... other configuration ...
    }
    ```

    DESCRIPTION
}

variable "retention_in_days" {
    type = number
}