package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Resource_Aws_Ec2_Keypair_Component(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../resources/aws/ec2/keypair",
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)

}
