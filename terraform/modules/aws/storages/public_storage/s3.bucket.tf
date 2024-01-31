module "s3_bucket" {
  source = "../../../../resources/aws/s3/bucket"

  bucket = var.bucket_name
  tags   = var.tags
  #   aws_s3_bucket_name = "proctormatic-xinics-dev-s3-fe-asset-ap-northeast-2"
  #   aws_resource_tags = {
  #     Name            = "proctormatic-xinics-dev-s3-fe-asset-ap-northeast-2"
  #     group-service   = local.tags.group-service
  #     group-stage     = local.tags.group-stage.dev
  #     group-purpose   = local.tags.group-purpose.video
  #     group-position  = local.tags.group-position.be
  #     resource-level  = local.tags.resource-level.region
  #     resource-region = local.tags.resource-region.seoul
  #     manager         = local.tags.manager.kevin
  #   }
}
