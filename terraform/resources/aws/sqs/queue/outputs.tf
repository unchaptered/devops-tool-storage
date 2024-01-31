output "arn" {
  sensitive = true
  value     = aws_sqs_queue.aws_sqs_queue_module.arn
}

output "queue_id" {
  sensitive = true
  value     = aws_sqs_queue.aws_sqs_queue_module.id
}

output "queue_url" {
  sensitive = true
  value     = aws_sqs_queue.aws_sqs_queue_module.url
}
