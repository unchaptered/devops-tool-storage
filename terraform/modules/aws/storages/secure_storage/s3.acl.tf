module "s3_acl" {
  source = "../../../../resources/aws/s3/acl"

  bucket_id  = module.s3_bucket.id
  depends_on = [module.s3_bucket]
}