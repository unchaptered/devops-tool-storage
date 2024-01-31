variable "name" {
  type        = string
  description = "AWS EC2 ASG의 이름 (AWS Console 노출)"

}
variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "AWS ASG가 속할 Subnet의 고유식별자 Id"
}

# variable "launch_configuration" {
#   type = string
# }
variable "launch_template_id" {
  type        = string
  description = "AWS EC2 Launch Template 고유식별자 ID"
}

variable "launch_template_version" {
  type        = string
  description = "AWS EC2 Launch Template 버전"
}


variable "lb_target_group_arn" {
  type        = string
  description = "AWS LB TargetGroup의 고유식별자 Arn"
}
