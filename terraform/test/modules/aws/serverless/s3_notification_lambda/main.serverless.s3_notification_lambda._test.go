package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Modules_Aws_Serverless_S3NotificationLambda(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../modules/aws/serverless/s3_notification_lambda",
		VarFiles:     []string{"./sample.tfvars"},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
