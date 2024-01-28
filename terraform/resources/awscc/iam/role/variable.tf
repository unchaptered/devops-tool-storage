variable "role_name" {
  type = string
}

variable "assume_role_policy_document" {
  type = any
}

variable "managed_policy_arns" {
  type    = list(string)
  default = []
}
