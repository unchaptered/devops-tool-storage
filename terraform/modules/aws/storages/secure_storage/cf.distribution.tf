module "cf_distribution" {
  source = "../../../../resources/aws/cloudfront/distribution"

  enabled             = false
  is_ipv6_enabled     = false
  default_root_object = null
  price_class         = "PriceClass_100"
  comment             = "${var.prefix}-cf-${var.bucket_name}-${var.suffix}"
  tags                = var.cf_distribution_tags

  origin_block = {
    origin_id                = module.s3_bucket.id
    domain_name              = null
    origin_access_control_id = module.cf_distribution_oac.id
  }

  viewer_certificate_block = {
    cloudfront_default_certificate = true

    ssl_support_method  = null
    acm_certificate_arn = null
  }

  restrictions = {
    geo_restriction = {
      restriction_type = "none"
    }
  }

  default_cache_behavior_block = {
    compress               = false
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0

    allowed_methods    = ["GET", "HEAD", "OPTIONS"]
    cached_methods     = ["GET", "HEAD", "OPTIONS"]
    target_origin_id   = module.s3_bucket.id
    trusted_key_groups = var.cf_distribution_trusted_key_groups

    is_enabled_forwarded_values = false
    query_string                = null
    cookies_foward              = null
  }

  custom_error_responses = null

}