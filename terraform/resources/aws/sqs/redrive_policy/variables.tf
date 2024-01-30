variable "queue_id" {
  type = string
}
variable "redrive_policy" {
  type = object({
    deadLetterTargetArn = string
    maxReceiveCount     = number
  })
}
