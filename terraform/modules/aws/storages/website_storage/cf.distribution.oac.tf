module "cf_oac_website" {
  source = "../../../../resources/aws/cloudfront/origin_access_control"

  name = "${var.prefix}-cf-oac-${var.module_name}-${var.suffix}"
  description = ""

  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
