resource "aws_s3_bucket_ownership_controls" "resource" {
  bucket = var.bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
