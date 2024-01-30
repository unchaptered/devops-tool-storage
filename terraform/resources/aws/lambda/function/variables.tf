variable "architectures" {
  type    = list(string)
  default = ["x86_64"]
}
variable "function_name" {
  type        = string
  description = "resource.aws_lambda_funciton.function_name"
}
variable "handler" {
  type        = string
  description = <<-DESCRIPTION
    index.handler
  DESCRIPTION
}
variable "role" {
  type = string
}
variable "runtime" {
  type    = string
  default = "nodejs16.x"
  validation {
    condition     = can(regex("^(nodejs16.x|nodejs18.x|nodejs20.x)$", var.runtime))
    error_message = "Invalid runtime, only allowed runtime are: 'nodejs16.x', 'nodejs18.x', 'nodejs20.x'"
  }
}
variable "skip_destroy" {
  type    = bool
  default = false
}
variable "source_code_hash" {
  type    = string
  default = "hello"
}

variable "layers" {
  type    = list(any)
  default = []
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "package_type" {
  type    = string
  default = "Zip"
}

variable "reserved_concurrent_executions" {
  type    = number
  default = -1
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "tags_all" {
  type    = map(any)
  default = {}
}

variable "timeout" {
  type    = number
  default = 60
}

variable "filename" {
  type = string
}

variable "ephemeral_storage_size" {
  type    = number
  default = 512
}

variable "tracing_config_mode" {
  type    = string
  default = "PassThrough"
}

variable "environment" {
  type    = map(any)
  default = null
}

variable "vpc_config" {
  type = object({
    ipv6_allowed_for_dual_stack = bool
    security_group_ids          = list(string)
    subnet_ids                  = list(string)
  })
}
