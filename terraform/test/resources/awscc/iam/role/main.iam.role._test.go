package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resources_AWSCC_Iam_Role(t *testing.T) {
	mockRoleName := "mockRoleName"
	mockAssumeRolePolicyDocument := `{ "key1": "text", "key2": 10 }`

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../resources/awscc/iam/role",
		Vars: map[string]interface{}{
			"role_name":                   mockRoleName,
			"assume_role_policy_document": mockAssumeRolePolicyDocument,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
