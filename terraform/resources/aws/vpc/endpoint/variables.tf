variable "vpc_id" {
  type        = string
  description = "AWS VPC 고유식별자 Id"
}

variable "subnet_ids" {
  type        = list(string)
  description = "AWS VPC Subnet 고유식별자 Ids"
}


variable "service_name" {
  type        = string
  description = "AWS Service Name"
}

variable "vpc_endpoint_type" {
  type = string

  validation {
    condition     = can(regex("^(Gateway|Interface)$", var.vpc_endpoint_type))
    error_message = "Invalid vpc_endpoint_type, only allowed are : 'Gateway', 'Interface'"
  }

}

variable "tags" {
  type        = map(any)
  description = "AWS Resource Tags"
}
