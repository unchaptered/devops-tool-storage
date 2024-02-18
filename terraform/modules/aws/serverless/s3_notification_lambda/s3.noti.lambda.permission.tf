module "s3_noti_lambda_permission" {
  source = "../../../../resources/aws/lambda/permission"

  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_arn
  function_name = module.s3_noti_lambda.function_name
}
