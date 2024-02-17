profile = "aws_profile"
region  = "ap-northeast-2"

prefix = "lay-prod"
suffix = "ap-ne-2"

bucket_name = "dasmfkldasmlk"
bucket_cors_rules = [{
  allowed_headers = ["*"]
  allowed_methods = ["GET", "PUT"],
  allowed_origins = ["*"],
  expose_headers  = null,
}]
bucket_distribution_arn = "sample"
bucket_tags             = {}
