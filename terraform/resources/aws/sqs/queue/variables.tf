variable "name" {
  type = string
}

# Configuration
variable "visibility_timeout_seconds" {
  type        = number
  description = "resource.aws_sqs_queue.~.visibility_timeout_seconds arguements"
}
variable "message_retention_seconds" {
  type        = number
  description = "resource.aws_sqs_queue.~.message_retention_seconds arguements"
}
variable "max_message_size" {
  type        = number
  description = "resource.aws_sqs_queue.~.max_message_size arguements"

}
variable "delay_seconds" {
  type        = number
  description = "resource.aws_sqs_queue.~.delay_seconds arguements"
}
variable "receive_wait_time_seconds" {
  type        = number
  description = "resource.aws_sqs_queue.~.receive_wait_time_seconds arguements"
}

# FIFO Queue
variable "fifo_queue" {
  type        = bool
  description = "resource.aws_sqs_queue.~.fifo_queue arguements"
}
variable "content_based_deduplication" {
  type        = bool
  description = "resource.aws_sqs_queue.~.content_based_deduplication arguements"
}

# HighPerformance FIFO Queue
variable "deduplication_scope" {
  type        = string
  description = "resource.aws_sqs_queue.~.deduplication_scope arguements"

  validation {
    condition     = var.deduplication_scope != null ? can(regex("^(messageGroup|queue)$", var.deduplication_scope)) : true
    error_message = "Invalid deduplication_scope, only allowed deduplication_scope are: 'messageGroup', 'queue'"
  }
}
variable "fifo_throughput_limit" {
  type        = string
  description = "resource.aws_sqs_queue.~.fifo_throughput_limit arguements"

  validation {
    condition     = var.fifo_throughput_limit != null ? can(regex("^(perQueue|perMessageGroupId)$", var.fifo_throughput_limit)) : true
    error_message = "Invalid fifo_throughput_limit, only allowed fifo_throughput_limit are: 'perQueue', 'perMessageGroupId'"
  }
}
# variable "policy" {
#   type = object({
#     Id      = string
#     Version = string
#     Statement = list(object({
#       Sid    = string
#       Effect = string
#       # Principal = map(any)
#       Action   = list(string)
#       Resource = list(string)
#     }))
#   })
# }
# variable "redrive_policy" {
#   type = object({
#     deadLetterTargetArn = string
#     maxReceiveCount     = number
#   })
#   default = null

# }

variable "tags" {
  type = map(any)
}
