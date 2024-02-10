package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resources_AWSCC_Chatbot_Configuration(t *testing.T) {
	mockConfigurationName := "mockConfigurationName"
	mockIamRoleArn := "mockIamRoleArn"
	mockSlackChannelId := "mockSlackChannelId"
	mockSlackWorkspaceId := "mockSlackWorkspaceId"

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../resources/awscc/chatbot/configuration",
		Vars: map[string]interface{}{
			"configuration_name": mockConfigurationName,
			"iam_role_arn":       mockIamRoleArn,
			"slack_channel_id":   mockSlackChannelId,
			"slack_workspace_id": mockSlackWorkspaceId,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
