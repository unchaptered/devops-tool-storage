variable "vpc_id" {
  type        = string
  description = "생성되어있거나 예정 중인 VPC의 id"
}

variable "tags" {
  type = map(any)
}
