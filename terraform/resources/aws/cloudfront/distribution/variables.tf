variable "price_class" {
  type        = string
  description = <<-DESCRIPTION
    aws_cloudfront_distribution.resource.price_class

    - ERROR : Invalid price_class, only allowed price_class are: 'PriceClass_100', 'PriceClass_200', 'PriceClass_All'
    - References : https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html

    price_class = "PriceClass_100"
    - (NEW) North America(USA, Mexico, Canada)
    - (NEW) Europe Israel

    price_class = "PriceClass_200"
    - North America(USA, Mexico, Canada)
    - Europe Israel

    - (NEW) South Africa/Kenya/MiddleEast
    - (NEW) Japan
    - (NEW) HongKong/Indonesia/Philippines/Singapore/Korea/Taiwan/Thailand
    - (NEW) India
    
    price_class = "PriceClass_All"
    - North America(USA, Mexico, Canada)
    - Europe Israel

    - South Africa/Kenya/MiddleEast
    - Japan
    - HongKong/Indonesia/Philippines/Singapore/Korea/Taiwan/Thailand
    - India

    - (NEW) South America
    - (NEW) Austrailia/NewZealand
  DESCRIPTION

  validation {
    condition     = can(regex("^(PriceClass_100|PriceClass_200|PriceClass_All)$", var.price_class))
    error_message = "Invalid price_class, only allowed price_class are: 'PriceClass_100', 'PriceClass_200', 'PriceClass_All'"
  }
}
variable "aliases" {
  type        = list(string)
  default     = []
  description = "resource.aws_cloudfront_distribution.~.aliases"
}

variable "comment" {
  type        = string
  description = "resource.aws_cloudfront_distribution.~.comment"
}
variable "enabled" {
  type        = string
  description = "resource.aws_cloudfront_distribution.~.enabled"
}
variable "is_ipv6_enabled" {
  type        = string
  description = "resource.aws_cloudfront_distribution.~.is_ipv6_enabled"
}
variable "default_root_object" {
  type        = string
  description = "resource.aws_cloudfront_distribution.~.default_root_object"
}

variable "tags" {
  type = map(any)
}

variable "origin_block" {
  type = object({
    origin_id                = string
    domain_name              = string
    origin_access_control_id = string
  })
}

variable "default_cache_behavior_block" {
  type = object({
    compress               = string
    cache_policy_id        = string
    viewer_protocol_policy = string

    min_ttl     = string
    default_ttl = string
    max_ttl     = string

    allowed_methods = list(string)
    cached_methods  = list(string)

    target_origin_id   = string
    trusted_key_groups = list(string)

    is_enabled_forwarded_values = bool
    cookies_foward              = bool
    query_string                = string
  })

  default = {
    compress               = false
    cache_policy_id        = null
    viewer_protocol_policy = "allow-all"

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    target_origin_id   = "S3Origin"
    trusted_key_groups = []



    is_enabled_forwarded_values = false
    cookies_foward              = false
    query_string                = "none"
  }
}

variable "restrictions" {
  type = object({
    geo_restriction = object({
      restriction_type = string
    })
  })

  default = {
    geo_restriction = {
      restriction_type = "none"
    }
  }

}

variable "viewer_certificate_block" {
  type = object({
    cloudfront_default_certificate = bool
    acm_certificate_arn            = string
    ssl_support_method             = string
  })
  default = {
    cloudfront_default_certificate = false
    acm_certificate_arn            = null
    ssl_support_method             = null
  }
}

variable "custom_error_responses" {
  type = list(object({
    error_caching_min_ttl = number
    error_code            = number
    response_code         = number
    response_page_path    = string
  }))
  default = []
}
