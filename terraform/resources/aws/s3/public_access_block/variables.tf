variable "bucket_id" {
  type = string
}
variable "block_public_acls" {
  type    = bool
  default = false
}
variable "block_public_policy" {
  type    = bool
  default = false
}
variable "ignore_public_acls" {
  type    = bool
  default = false
}
variable "restrict_public_buckets" {
  type    = bool
  default = false
}
