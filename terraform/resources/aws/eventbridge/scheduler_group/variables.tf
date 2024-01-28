variable "name" {
  type = string
}
variable "tags" {
  type    = map(any)
  default = {}
}
variable "tags_all" {
  type    = map(any)
  default = {}
}
