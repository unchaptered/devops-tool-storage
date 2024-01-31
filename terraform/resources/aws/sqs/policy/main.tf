resource "aws_sqs_queue_policy" "aws_sqs_queue_policy_module" {
  queue_url = var.query_id
  policy    = var.policy
}
