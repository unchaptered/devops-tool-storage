resource "aws_sqs_queue" "aws_sqs_queue_module" {
  name = var.name

  # Configuration
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds

  # [FIFO Queue]
  fifo_queue                  = var.fifo_queue                  # bool
  content_based_deduplication = var.content_based_deduplication # bool

  # [High-throughput FIFO Queue]
  deduplication_scope   = var.fifo_queue ? var.deduplication_scope : null   # ["messageGroup", "queue"]
  fifo_throughput_limit = var.fifo_queue ? var.fifo_throughput_limit : null # ["perQueue", "perMessageGroupId"]


  # Policy & Management
  # policy = jsonencode(var.policy)
  # redrive_policy = jsonencode(var.redrive_policy)
  # redrive_allow_policy = jsonencode(var.redrive_allow_policy)
  tags = var.tags

}
