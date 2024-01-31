variable "policy_name" {
  type        = string
  description = "AWS IAM Policy 고유식별자 Name"
}

variable "policy_description" {
  type        = string
  description = "AWS IAM Policy Description"
}

variable "policy_value" {
  type        = any
  description = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "s3:ListBucket",
            "s3:GetObject"
          ],
          "Resource": [
            "arn:aws:s3:::example-bucket",
            "arn:aws:s3:::example-bucket/*"
          ]
        }
      ]
    }
  EOF 
}

variable "iam_user_name" {
  type        = string
  description = "AWS IAM User 고유식별자 Name"
}
