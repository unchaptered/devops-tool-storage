module "eb_sch" {
  source = "../../../../resources/aws/eventbridge/scheduler"

  name = "${var.prefix}-eb-sch-${var.eb_sch_module_name}-${var.suffix}"

  group_name          = var.eb_sch_module_name
  schedule_expression = var.eb_sch_expression

  target_block = {
    arn      = ""
    role_arn = ""
    input    = null
  }
}