module "s3_website_bucket_policy" {
  source = "../../../../resources/aws/s3/bucket_policy"

  bucket = module.s3_bucket.bucket
  policy = {
    Version = "2008-10-17",
    Id      = "PolicyForCloudFrontPrivateContent",
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal",
        Effect = "Allow",
        Principal = {
          "Service" = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "${module.s3_bucket.arn}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = module.cf_dist_website.arn
          }
        }
      }
    ]
  }
  depends_on = [
    module.s3_website,
    module.cf_dist_website
  ]

}
