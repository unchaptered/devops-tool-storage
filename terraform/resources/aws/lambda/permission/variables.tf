variable "statement_id" {
  type        = string
  default     = "AllowExecutionFromS3"
  description = <<-DESCRIPTION
    AllowExecutionFromS3

    resource.aws_lambda_permission.statement_id
  DESCRIPTION
}

variable "action" {
  type        = string
  default     = "lambda:InvokeFunction"
}

variable "function_name" {
  type        = string
}
variable "principal" {
  type        = string
}

variable "source_arn" {
  type        = string
}
