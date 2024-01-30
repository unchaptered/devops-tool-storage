resource "aws_lambda_function" "resource" {

  architectures    = var.architectures
  function_name    = var.function_name
  handler          = var.handler
  role             = var.role
  runtime          = var.runtime          # nodejs16.x nodejs18.x nodejs20.x
  skip_destroy     = var.skip_destroy     # false
  source_code_hash = var.source_code_hash # "hello"

  layers                         = var.layers                         # []
  memory_size                    = var.memory_size                    # 128
  package_type                   = var.package_type                   # "Zip"
  reserved_concurrent_executions = var.reserved_concurrent_executions # -1

  tags     = var.tags     # {}
  tags_all = var.tags_all # {}
  timeout  = var.timeout  # 60
  filename = var.filename # "public.ecr.aws/lambda/nodejs:16"
  lifecycle {
    ignore_changes = [
      filename,
      source_code_hash,
    ]
  }
  # https://github.com/hashicorp/terraform-provider-aws/issues/29043

  ephemeral_storage {
    size = var.ephemeral_storage_size
  }

  tracing_config {
    mode = var.tracing_config_mode # "PassThrough"
  }


  dynamic "environment" {
    for_each = var.environment == null ? [] : [var.environment]

    content {
      variables = var.environment
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]

    content {
      ipv6_allowed_for_dual_stack = vpc_config.value.ipv6_allowed_for_dual_stack
      security_group_ids          = vpc_config.value.security_group_ids
      subnet_ids                  = vpc_config.value.subnet_ids
    }
  }



}
