resource "aws_lambda_permission" "resource" {
  statement_id  = var.statement_id # "AllowExecutionFromS3"
  action        = var.action       # "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = var.principal
  source_arn    = var.source_arn
}
