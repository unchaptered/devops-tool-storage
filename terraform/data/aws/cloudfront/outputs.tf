output "domain_name" {
  value = data.aws_cloudfront_distribution.datasource.domain_name
}

output "hosted_zone_id" {
  value = data.aws_cloudfront_distribution.datasource.hosted_zone_id
}
