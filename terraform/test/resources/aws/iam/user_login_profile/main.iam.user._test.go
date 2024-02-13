package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_Iam_UserLoginProfile_Component(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/iam/user_login_profile",
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
