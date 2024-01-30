variable "queue_id" {
  type = string
}

variable "redrive_allow_policy" {
  type = object({
    redrivePermission = string,
    sourceQueueArns   = list(string)
  })
}
