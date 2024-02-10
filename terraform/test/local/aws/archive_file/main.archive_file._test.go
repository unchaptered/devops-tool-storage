package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsLocalArchiveFile(t *testing.T) {
	mockType := "mockType"
	mockSourceDir := "mockSourceDir"
	mockOutputPath := "mockOutputPath"

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../local/aws/archive_file",
		Vars: map[string]interface{}{
			"type":        mockType,
			"source_dir":  mockSourceDir,
			"output_path": mockOutputPath,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
