resource "aws_s3_bucket" "resource" {
  bucket = var.bucket_name

  tags = var.tags
}
