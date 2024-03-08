module "s3_noti_iam_policy_doucment" {
    source = "../../../../data/aws/iam/policy_document"

    statements = [{
        effect = "Allow"
        sid = null
        condition = []
        resources = []
        actions = ["sts:AssumeRole"]
        principals = [{
          type = "Service"
          identifiers = ["lambda.amazonaws.com"]
        }]
    }]
}   