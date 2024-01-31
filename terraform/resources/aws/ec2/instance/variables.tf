variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "tags" {
  type = map(any)
}

variable "subnet_id" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "iam_instance_profile" {
  type = string
}
