variable "bucket" {
  type        = string
  sensitive   = true
  description = "S3 버킷의 고유 식별자 ID"

}
variable "acl" {
  type      = string
  sensitive = true
  default   = "private"

  # https://dev.to/pwd9000/terraform-variable-validation-47ka
  validation {
    condition     = can(regex("^(private|public-read|public-read-write|authenticated-read)$", var.aws_s3_bucket_acl))
    error_message = "Invalid aws_s3_bucket_acl, only allowed aws_s3_bucket_acl are: 'private', 'public-read', 'public-read-write', 'authenticated-read'"
  }

}
