variable "name" {
  type        = string
  description = "aws_cloudfront_key_group.resource.name"
}

variable "comment" {
  type        = string
  description = "aws_cloudfront_key_group.resource.comment"
}

variable "items" {
  type        = list(string)
  description = <<-DESCRIPTION
    aws_cloudfront_key_group.resource.items

    - allocated by resource.aws_cloudfront_public_key.*.id
  DESCRIPTION
}
