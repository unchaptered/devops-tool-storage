module "s3_ownership_controls" {
  source = "../../../../resources/aws/s3/ownership_controls"

  bucket     = module.s3_bucket.bucket
  depends_on = [module.s3_bucket]
}