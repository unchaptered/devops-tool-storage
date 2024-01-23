output "id" {
  sensitive   = true
  value       = aws_s3_bucket.resource.id
  description = "S3 버킷 고유식별자 ID (id)"
}

output "bucket_regional_domain_name" {
  sensitive   = true
  value       = aws_s3_bucket.resource.bucket_regional_domain_name
  description = "S3 버킷 고유식별자 ID (bucket_regional_domain_name)"
}

output "bucket" {
  sensitive = true
  value     = aws_s3_bucket.resource.bucket
}

output "arn" {
  sensitive = true
  value     = aws_s3_bucket.resource.arn
}
