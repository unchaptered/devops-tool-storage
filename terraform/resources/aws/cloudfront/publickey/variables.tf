variable "encoded_key" {
  type        = string
  description = <<-DESCRIPTION
    aws_cloudfront_public_key.resource.encoded_key

    - file("public_key.pem")
    DESCRIPTION
}

variable "name" {
  type        = string
  description = "aws_cloudfront_public_key.resource.name"
}

variable "comment" {
  type        = string
  description = "aws_cloudfront_public_key.resource.comment"
}
