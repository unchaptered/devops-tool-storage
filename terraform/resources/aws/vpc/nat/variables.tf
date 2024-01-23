variable "allocation_id" {
  type        = string
  description = "resource.aws_eip.aws_eip_module의 id"
}
variable "subnet_id" {
  type        = string
  description = "resource.aws_subnet.aws_subnet_module의 id"
}
variable "tags" {
  type = map(any)
}
