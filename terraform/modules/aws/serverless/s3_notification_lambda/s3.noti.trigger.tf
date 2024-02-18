module "s3_noti_trigger" {
    source = "../../../../resources/aws/s3/bucket_notification"

    bucket_id = ""
    lambda_functions = [{
      lambda_function_arn = module.s3_noti_lambda.arn
      events = var.s3_noti_trigger_events
      filter_prefix = null
      filter_suffix = null
    }]
}