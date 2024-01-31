
variable "name" {
  type = string
}

variable "assume_role_policy" {
  type = any
}

variable "managed_policy_arns" {
  type    = list(string)
  default = []
}

variable "inline_policy_name" {
  type    = string
  default = null
}

variable "inline_policy_version" {
  type    = string
  default = null
}

variable "inline_policy_statements" {
  type = list(object({
    Action   = list(string)
    Effect   = string
    Resource = string
  }))
  default = []
}


variable "tags" {
  type    = map(any)
  default = {}
}
