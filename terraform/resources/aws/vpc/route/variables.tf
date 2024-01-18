variable "route_table_id" {
  type        = string
  description = "resource.aws_route_table_aws_route_table_module의 id"
}
variable "destination_cidr_block" {
  type        = string
  description = "0.0.0.0/0이 대부분 그 외는 설정에 따라서 지정"
}
variable "gateway_id" {
  type        = string
  default     = null
  description = "resource.aws_internet_gateway.aws_internet_gateway_module의 id"
}
variable "nat_gateway_id" {
  type        = string
  default     = null
  description = "resource.aws_internet_gateway.aws_internet_gateway_module의 id"
}
