variable "bucket_id" {
  type = string
}

variable "cors_rules" {
  default = []
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
  }))
}
