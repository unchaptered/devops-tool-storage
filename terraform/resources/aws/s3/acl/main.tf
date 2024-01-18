resource "aws_s3_bucket_acl" "resource" {
  bucket = var.bucket
  acl    = var.acl
}
