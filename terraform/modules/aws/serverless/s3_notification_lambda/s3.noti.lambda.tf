module "s3_noti_lambda" {
    source = "../../../../resources/aws/lambda/function"

  architectures = ["x86_64"]
  function_name = "${var.prefix}-lambda-${var.module_name}-${var.suffix}"
  handler       = "index.handler"
  role          = module.s3_noti_iam_role.arn
   
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
    security_group_ids          = [module.s3_noti_lambda_sg.id]
    subnet_ids                  = var.s3_noti_labmda_subnet_ids
  }

  tags = var.s3_noti_lambda_tags

}