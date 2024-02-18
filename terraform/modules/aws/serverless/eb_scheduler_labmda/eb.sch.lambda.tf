module "eb_sch_lambda" {
  source = "../../../../resources/aws/lambda/function"

  role = module.eb_sch_iam_role.arn

  architectures = ["x86_64"]
  function_name = "${var.prefix}-lambda-function-${var.eb_sch_module_name}-${var.suffix}"
  handler       = "index.handler"

  runtime          = "nodejs16.x"
  filename         = "./sample-lambda.zip"
  skip_destroy     = false
  source_code_hash = "gp9qRIEwMBPJNVaM+zj7DBQokrdIKhLQ9HMntWNNzf8="
  layers           = []

  memory_size                    = 128
  package_type                   = null
  reserved_concurrent_executions = -1
  timeout                        = 60
  ephemeral_storage_size         = 512
  tracing_config_mode            = "PassThrough"
  environment                    = {}

  vpc_config = {
    ipv6_allowed_for_dual_stack = false
    security_group_ids          = [module.eb_sch_lambda_sg.id]
    subnet_ids                  = var.eb_sch_labmda_subnet_ids
  }

  tags = var.eb_sch_lambda_tags
}