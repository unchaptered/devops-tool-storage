package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_Iam_GroupPolicy_Component(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/iam/group_policy",
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
