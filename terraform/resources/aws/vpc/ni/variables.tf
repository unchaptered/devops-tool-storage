variable "subnet_id" {
  type        = string
  description = "AWS Subnet 고유 식별자 Id"
}

variable "security_groups" {
  type        = list(string)
  description = "AWS SG 고유 식별자 Ids"
}
