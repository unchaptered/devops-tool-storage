resource "aws_s3_bucket_policy" "resource" {
  bucket = var.bucket

  policy = jsonencode(var.policy)
}
