package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_S3_CorsConfiguration_Component(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/s3/cors_configuration",
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
