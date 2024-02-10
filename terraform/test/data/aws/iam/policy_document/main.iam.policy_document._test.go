package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDataAwsIamPolicyDocument(t *testing.T) {
	t.Parallel()

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../data/aws/ec2/instance_offering",
	})
	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)

}
