variable "bucket_id" {
  type      = string
  sensitive = true

}
variable "acl" {
  type      = string
  sensitive = true
  default   = "private"

  # https://dev.to/pwd9000/terraform-variable-validation-47ka
  validation {
    condition     = can(regex("^(private|public-read|public-read-write|authenticated-read)$", var.acl))
    error_message = "Invalid acl, only allowed acl are: 'private', 'public-read', 'public-read-write', 'authenticated-read'"
  }

}
