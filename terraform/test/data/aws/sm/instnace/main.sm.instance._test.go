package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDataAwsSmInstance(t *testing.T) {
	t.Parallel()

	// mockDomainName := "example.com"
	// mockProviderRegion := "us-east-1"

	mockSecretKey := "mockSecretKey"

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../data/aws/sm/instance",
		Vars: map[string]interface{}{
			"secret_key": mockSecretKey,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
