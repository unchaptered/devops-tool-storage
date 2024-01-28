
resource "aws_scheduler_schedule" "resource" {
  name                = var.name
  group_name          = var.group_name
  schedule_expression = var.schedule_expression

  flexible_time_window {
    mode = var.flexible_time_window.mode
  }

  target {
    arn      = var.target.arn
    role_arn = var.target.role_arn
    input    = var.target.role_input != null ? jsonencode(var.target.role_input) : null
  }
}
