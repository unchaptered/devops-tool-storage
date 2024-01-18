variable "name" {
  sensitive = true
  type      = string
}

variable "tags" {
  type = map(any)
}
