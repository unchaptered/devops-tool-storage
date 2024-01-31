module "s3_bucket" {
  source = "../../../../resources/aws/s3/bucket"

  bucket_name = "${var.prefix}-${var.bucket_name}-${var.suffix}"
  tags        = var.tags
}
