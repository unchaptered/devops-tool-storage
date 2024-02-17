module "s3_cors_configuration" {
  source = "../../../../resources/aws/s3/cors_configuration"

  bucket_id = module.s3_bucket.id

  cors_rules = var.bucket_cors_rules

  depends_on = [module.s3_bucket]
}