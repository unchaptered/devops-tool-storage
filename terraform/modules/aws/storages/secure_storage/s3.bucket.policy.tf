module "s3_bucket_policy" {
  source = "../../../../resources/aws/s3/bucket_policy"

  bucket = module.s3_bucket.bucket

  policy = {
    Version = "2008-10-17",
    Id      = "PolicyForCloudFrontPrivateContent",
    Statement = [
      {
        Sid      = "AllowCloudFrontServicePrincipal",
        Effect   = "Allow",
        Resource = "${module.s3_bucket.arn}/*",
        Principal = {
          "Service" = "cloudfront.amazonaws.com"
        },
        Action = [
          "s3:GetObject"
        ],
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = var.bucket_distribution_arn
          }
        }
      },
      {
        Effect   = "Allow",
        Resource = "${module.s3_bucket.arn}/*"
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
      },

    ]
  }

  depends_on = [module.s3_bucket]
}