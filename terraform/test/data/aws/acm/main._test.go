package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDataAwsAmi(t *testing.T) {
	t.Parallel()

	// 테스트 옵션을 설정합니다.
	options := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../data/aws/acm",
		Vars: map[string]interface{}{
			"domain": "example.com",
			"status": []string{"ISSUED"},
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},
	})

	// C:\Personal\iac-storage\terraform\data\aws\acm
	// C:\Personal\iac-storage\terraform\test\data\aws\acm
	// Terraform 초기화 및 적용
	defer terraform.Destroy(t, options)

	terraform.InitAndValidateE(t, options)

	// terraform.InitAndApply(t, options)

	// Terraform 적용 결과 출력
	// arn := terraform.Output(t, options, "arn")

	// 출력값을 검증합니다.
	// assert.Equal(t, "sadsad", arn)
	// assert.Equal(t, 1, "dd")
}
