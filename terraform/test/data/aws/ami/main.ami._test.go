package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDataAwsAmi(t *testing.T) {
	t.Parallel()

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../data/aws/ami",
	})
	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)

}
