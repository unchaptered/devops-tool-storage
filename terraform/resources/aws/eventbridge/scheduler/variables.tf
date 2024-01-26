variable "name" {
  type        = string
  description = "resource.aws_scheduler_schedule.~.name"
}
variable "group_name" {
  type        = string
  description = "resource.aws_scheduler_schedule.~.group_name"
}
variable "schedule_expression" {
  type        = string
  description = "resource.aws_scheduler_schedule.~.schedule_expression"
}


variable "flexible_time_window_object" {
  type = object({
    mode = string
  })
  default = {
    mode = "oFF"
  }
}

variable "target" {
  type = object({
    arn      = string
    role_arn = string
    input    = string
  })
  default = {
    input = null
  }
}
