resource "aws_sqs_queue_redrive_allow_policy" "aws_sqs_queue_redrive_allow_policy_module" {
  queue_url            = var.queue_id
  redrive_allow_policy = jsonencode(var.redrive_allow_policy)
}
