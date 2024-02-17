# [Provider]
profile = "aws_profile"
region  = "ap-northeast-2"

# [Structure]
prefix = "lay-prod"
suffix = "ap-ne-2"

# [Resource]
bucket_name             = "dasmfkldasmlk"
bucket_distribution_arn = "sample"
bucket_tags             = {}
bucket_cors_rules = [{
  allowed_headers = ["*"]
  allowed_methods = ["GET", "PUT"],
  allowed_origins = ["*"],
  expose_headers  = null,
}]

cf_distribution_tags               = {}
cf_distribution_trusted_key_groups = ["sample"]