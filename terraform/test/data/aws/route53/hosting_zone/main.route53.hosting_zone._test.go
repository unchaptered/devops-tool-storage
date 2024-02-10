package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDataAwsRoute53HostingZone(t *testing.T) {
	t.Parallel()

	mockDomainName := "example.com"
	mockProviderRegion := "us-east-1"

	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../data/aws/route53/hosting_zone",
		Vars: map[string]interface{}{
			"domain_name": mockDomainName,
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": mockProviderRegion,
		},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
