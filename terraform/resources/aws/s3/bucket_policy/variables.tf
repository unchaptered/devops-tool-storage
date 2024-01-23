variable "bucket" {
  type        = string
  description = <<-DESCRIPTION
    resource.aws_s3_bucket.<BUCKET_NAME>.bucket
  DESCRIPTION
}

variable "policy" {
  type        = any
  description = <<-DESCRIPTION
    {
      "Version": "2008-10-17",
      "Id": "PolicyForCloudFrontPrivateContent",
      "Statement": [
          {
              "Sid": "AllowCloudFrontServicePrincipal",
              "Effect": "Allow",
              "Principal": {
                  "Service": "cloudfront.amazonaws.com"
              },
              "Action": "s3:GetObject",
              "Resource": "arn:aws:s3:::proctormatic-xinics-dev-s3-be-other-files-ap-northeast-2/*",
              "Condition": {
                  "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::<ACCOUNT_ID>:distribution/>DIST_DI>"
                  }
              }
          }
      ]
    }
  DESCRIPTION
}
