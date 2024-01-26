resource "awscc_chatbot_slack_channel_configuration" "resource" {
  configuration_name = var.configuration_name # "example-slack-channel-config"
  iam_role_arn       = var.iam_role_arn
  slack_channel_id   = var.slack_channel_id
  slack_workspace_id = var.slack_workspace_id
}
