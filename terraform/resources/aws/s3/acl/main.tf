resource "aws_s3_bucket_acl" "resource" {
  bucket = var.bucket_id
  acl    = var.acl
}
