resource "aws_cloudfront_key_group" "resource" {
  name    = var.name
  comment = var.comment
  items   = var.items
}
