
variable "name" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_access" {
  type = bool
}

variable "security_group_ids" {
  type = list(string)
}

variable "iam_instance_profile_arn" {
  type = string
}

variable "block_device_mappings_device_name" {
  type    = string
  default = "/dev/sda1"
}
variable "block_device_mappings_ebs_volume_size" {
  type    = number
  default = 32
}
variable "block_device_mappings_ebs_volume_type" {
  type    = string
  default = "gp3"

  validation {
    condition     = can(regex("^(gp2|gp3)$", var.block_device_mappings_ebs_volume_type))
    error_message = "Invalid block_device_mappings_ebs_volume_type, only allowed block_device_mappings_ebs_volume_type are: 'Server', 'Lambda'"
  }
}

variable "block_device_mappings_ebs_delete_on_termination" {
  type    = bool
  default = true
}
variable "block_device_mappings_ebs_encrypted" {
  type    = bool
  default = false
}

variable "tags" {
  type = map(any)
}

variable "tag_specifications_tags" {
  type = map(any)
}
