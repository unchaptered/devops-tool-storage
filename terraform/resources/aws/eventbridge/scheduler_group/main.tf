resource "aws_scheduler_schedule_group" "resource" {
  name     = var.name
  tags     = var.tags
  tags_all = var.tags_all
}
