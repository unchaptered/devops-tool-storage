package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_Cloudfront_OriginAccessControl_Component(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/cloudfront/origin_access_control",
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)

}
