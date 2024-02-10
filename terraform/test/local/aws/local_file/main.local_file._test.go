package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsLocalLocalFile(t *testing.T) {
	mockContent := "mockContent"
	mockFilename := "mockFilename"

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../local/aws/local_file",
		Vars: map[string]interface{}{
			"content":  mockContent,
			"filename": mockFilename,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
