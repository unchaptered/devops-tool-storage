data "aws_iam_policy_document" "aws_iam_policy_document_module" {

  dynamic "statement" {
    for_each = var.statements

    content {
      sid    = statement.value.sid    # "First"
      effect = statement.value.effect # "Allow"

      actions   = statement.value.actions   # ["sqs:SendMessage"]
      resources = statement.value.resources # [aws_sqs_queue.q.arn]

      dynamic "principals" {
        for_each = statement.value.principals

        content {
          type        = principals.value.type        #"*"
          identifiers = principals.value.identifiers #["*"]
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition

        content {
          test     = condition.value.test     # "ArnEquals"
          variable = condition.value.variable # "aws:SourceArn"
          values   = condition.value.values   # [aws_sns_topic.example.arn]
        }
      }
    }
  }
}
