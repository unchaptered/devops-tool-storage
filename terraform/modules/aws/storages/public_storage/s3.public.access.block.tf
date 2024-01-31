module "s3_public_access_block" {
  source = "../../../../resources/aws/s3/public_access_block"

  bucket     = module.s3_bucket.bucket
  depends_on = [module.s3_bucket.bucket]
}
