variable "domain_name" {
  type        = string
  description = "domain name"
}

variable "validation_method" {
  type        = string
  description = "domain name"
}

variable "tags" {
  type        = map(any)
  description = "AWS Resource Tags"
}
