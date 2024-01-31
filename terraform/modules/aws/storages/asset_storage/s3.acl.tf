module "s3_acl" {
  source = "../../../../resources/aws/s3/acl"

  acl       = "public-read"
  bucket_id = module.s3_bucket.id

  depends_on = [
    module.s3_bucket,
    module.s3_ownership_controls,
    module.s3_public_access_block,
  ]
}
