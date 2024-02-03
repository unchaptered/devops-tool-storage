variable "bucket_id" {
  type = string
}

variable "lambda_functions" {
  type = list(object({
    lambda_function_arn = string
    events              = list(string)
    filter_prefix       = string
    filter_suffix       = string
  }))
}
