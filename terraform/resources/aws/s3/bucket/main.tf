resource "aws_s3_bucket" "resource" {
  bucket = var.bucket

  tags = var.tags
}
