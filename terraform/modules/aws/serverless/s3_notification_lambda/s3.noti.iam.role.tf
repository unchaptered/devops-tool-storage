module "s3_noti_iam_role" {
    source = "../../../../resources/aws/iam/role"

    name = "${var.prefix}-iam-role-${var.module_name}-${var.suffix}"
    assume_role_policy = module.s3_noti_iam_policy_doucment.json
    # assume_role_policy = {
    #     Version = "2012-10-17",
    #     Statement = [
    #     {
    #         Action    = ["sts:AssumeRole"],
    #         Effect    = "Allow",
    #         Principal = { Service = "lambda.amazonaws.com" }
    #     }
    #     ]
    # }

    managed_policy_arns = []

    inline_policy_name    = "${var.prefix}-iam-policy-${var.module_name}-${var.suffix}"
    inline_policy_version = "2012-10-17"
    inline_policy_statements = [
        {
        Action = [
            "logs:CreateLogStream",
            "logs:CreateLogGroup",
            "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = ["*"]
        }
    ]

}