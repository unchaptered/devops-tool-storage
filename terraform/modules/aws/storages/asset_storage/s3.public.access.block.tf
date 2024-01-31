module "s3_public_access_block" {
  source = "../../../../resources/aws/s3/public_access_block"

  bucket_id  = module.s3_bucket.id
  depends_on = [module.s3_bucket]
}
