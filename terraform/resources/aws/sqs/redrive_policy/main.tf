resource "aws_sqs_queue_redrive_policy" "aws_sqs_queue_redrive_policy_module" {
  queue_url = var.queue_id

  redrive_policy = jsonencode(var.redrive_policy)
}


