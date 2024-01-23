variable "identifier" {
  type = string
}
variable "db_name" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "parameter_group_name" {
  type = string
}
variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "vpc_security_group_ids" {
  default     = []
  type        = list(string)
  sensitive   = true
  description = "AWS SG 그룹 ID 리스트"
}

variable "db_subnet_group_name" {
  default     = null
  type        = string
  sensitive   = true
  description = "AWS Sbunet 이름"
}


variable "aws_resource_tags" {
  type = map(any)
}
