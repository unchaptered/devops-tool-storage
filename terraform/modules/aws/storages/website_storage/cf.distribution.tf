module "cf_dist_website" {
  source = "../../../../resources/aws/cloudfront/distribution"

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "/index.html"
  price_class         = "PriceClass_100"
  aliases             = var.cf_dist_aliases
  comment             = "${var.prefix}-cf-${var.module_name}-${var.suffix}"
  tags                = {}

  origin_block = {
    origin_id                = module.s3_bucket.id
    domain_name              = module.s3_bucket.bucket_regional_domain_name
    origin_access_control_id = module.cf_oac_website.id
  }

  viewer_certificate_block = {
    acm_certificate_arn            = var.module_certificate_arn
    ssl_support_method             = "sni-only"
    cloudfront_default_certificate = true
  }

  default_cache_behavior_block = {
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    viewer_protocol_policy = "redirect-to-https"

    target_origin_id   = module.s3_bucket.id
    trusted_key_groups = null

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400

    allowed_methods             = ["GET", "HEAD", "OPTIONS"]
    cached_methods              = ["GET", "HEAD", "OPTIONS"]
    is_enabled_forwarded_values = false
  }

  custom_error_responses = [
    {
      error_caching_min_ttl = 10            #-> null
      error_code            = 400           #-> null
      response_code         = 400           #-> null
      response_page_path    = "/index.html" #-> null  
    },
    {
      error_caching_min_ttl = 10            #-> null
      error_code            = 403           #-> null
      response_code         = 403           #-> null
      response_page_path    = "/index.html" #-> null  
    },
    {
      error_caching_min_ttl = 10            #-> null
      error_code            = 404           #-> null
      response_code         = 404           #-> null
      response_page_path    = "/index.html" #-> null  
    },
    {
      error_caching_min_ttl = 10            #-> null
      error_code            = 502           #-> null
      response_code         = 502           #-> null
      response_page_path    = "/index.html" #-> null  
    }
  ]

}
