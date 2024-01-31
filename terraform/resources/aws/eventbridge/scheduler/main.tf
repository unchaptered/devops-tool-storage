
resource "aws_scheduler_schedule" "resource" {
  name                = var.name
  group_name          = var.group_name
  schedule_expression = var.schedule_expression

  flexible_time_window {
    mode = var.flexible_time_window_block.mode
  }

  target {
    arn      = var.target_block.arn
    role_arn = var.target_block.role_arn
    input    = var.target_block.input != null ? jsonencode(var.target_block.input) : null
  }
}
