resource "aws_db_parameter_group" "resource" {
  name        = var.name        # "example-parameter-group"
  family      = var.family      # "mysql5.7" # 원하는 데이터베이스 엔진 버전에 맞게 설정
  description = var.description # "Example DB Parameter Group"
}
