variable "name" {
  type        = string
  sensitive   = true
  description = "ex) example-parameter-group-name"
}

variable "family" {
  type        = string
  sensitive   = true
  description = "mysql.5 원하는 db랑 같은 버전 선택"
}

variable "description" {
  type        = string
  sensitive   = true
  description = "example-parameter-group 에 대한 설명"
}
