resource "aws_cloudfront_distribution" "resource" {

  price_class         = var.price_class
  aliases             = var.aliases
  comment             = var.comment
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object
  tags                = var.tags

  origin {
    origin_id                = var.origin_block.origin_id
    domain_name              = var.origin_block.domain_name
    origin_access_control_id = var.origin_block.origin_access_control_id # "var.origin_access_control_id"
  }

  default_cache_behavior {

    compress               = var.default_cache_behavior_block.compress               # false
    cache_policy_id        = var.default_cache_behavior_block.cache_policy_id        # "658327ea-f89d-4fab-a63d-7e88639e58f6"
    viewer_protocol_policy = var.default_cache_behavior_block.viewer_protocol_policy # "allow-all""

    min_ttl     = var.default_cache_behavior_block.min_ttl     # 0
    default_ttl = var.default_cache_behavior_block.default_ttl # 3600
    max_ttl     = var.default_cache_behavior_block.max_ttl     # 86400

    allowed_methods = var.default_cache_behavior_block.allowed_methods # ["GET", "HEAD", "OPTIONS"]"
    cached_methods  = var.default_cache_behavior_block.cached_methods  # ["GET", "HEAD", "OPTIONS"]"

    target_origin_id   = var.default_cache_behavior_block.target_origin_id   # "S3Origin""
    trusted_key_groups = var.default_cache_behavior_block.trusted_key_groups # 

    dynamic "forwarded_values" {
      for_each = var.default_cache_behavior_block.is_enabled_forwarded_values ? [1] : []

      content {
        query_string = var.default_cache_behavior_block.query_string
        cookies {
          forward = var.default_cache_behavior_block.cookies_foward
        }
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restrictions.geo_restriction.restriction_type
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.viewer_certificate_block.cloudfront_default_certificate
    acm_certificate_arn            = var.viewer_certificate_block.acm_certificate_arn
    ssl_support_method             = var.viewer_certificate_block.ssl_support_method
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_response

    content {
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
      error_code            = custom_error_response.value.error_cod
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
    }
  }
}
