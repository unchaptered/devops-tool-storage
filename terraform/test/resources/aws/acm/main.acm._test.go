package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_Acm_Component(t *testing.T) {
	mockDomainName := "mockDomainName"
	mockValidationMethod := "mockValidationMethod"
	mockTags := `{ "key": "value" }`

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/acm",
		Vars: map[string]interface{}{
			"domain_name":       mockDomainName,
			"validation_method": mockValidationMethod,
			"tags":              mockTags,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
