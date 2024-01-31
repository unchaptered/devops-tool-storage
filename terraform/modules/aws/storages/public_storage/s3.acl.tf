module "s3_acl" {
  source = "../../../../resources/aws/s3/acl"

  bucket     = module.s3_bucket.bucket
  acl        = "public-read"
  depends_on = [module.s3_bucket.bucket]
}
