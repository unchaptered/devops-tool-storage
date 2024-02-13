package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_Eventbridge_Scheduelr_Group_Component(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/eventbridge/scheduler_group",
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
