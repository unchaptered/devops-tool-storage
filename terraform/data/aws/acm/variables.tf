variable "domain" {
  type = string
}
variable "status" {
  type    = list(string)
  default = ["ISSUED"]
}
