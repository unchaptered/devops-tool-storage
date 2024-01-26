resource "aws_cloudfront_public_key" "resource" {
  encoded_key = var.encoded_key
  name        = var.name
  comment     = var.comment
}
