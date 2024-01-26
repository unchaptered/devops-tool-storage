variable "name" {
  type        = string
  description = "aws_cloudfront_origin_access_control.resource.name"
}

variable "description" {
  type        = string
  description = "aws_cloudfront_origin_access_control.resource.description"
}

variable "origin_access_control_origin_type" {
  type        = string
  default     = "s3"
  description = <<-DESCRIPTION
    aws_cloudfront_origin_access_control.resource.origin_access_control_origin_type

    - ERROR : Invalid origin_access_control_origin_type, only allowed app_compute_platform are: 's3'
  DESCRIPTION

  validation {
    condition     = can(regex("^(s3)$", var.origin_access_control_origin_type))
    error_message = "Invalid origin_access_control_origin_type, only allowed app_compute_platform are: 's3'"
  }
}

variable "signing_behavior" {
  type        = string
  default     = "always"
  description = <<-DESCRIPTION
    aws_cloudfront_origin_access_control.resource.signing_behavior"
    - ERROR : Invalid signing_behavior, only allowed app_compute_platform are: 'always'
  DESCRIPTION

  validation {
    condition     = can(regex("^(always)$", var.signing_behavior))
    error_message = "Invalid signing_behavior, only allowed app_compute_platform are: 'always'"
  }
}

variable "signing_protocol" {
  type        = string
  default     = "sigv4"
  description = <<-DESCRIPTION
    aws_cloudfront_origin_access_control.resource.signing_protocol"
    - ERROR : Invalid signing_protocol, only allowed app_compute_platform are: 'sigv4'
  DESCRIPTION
}
