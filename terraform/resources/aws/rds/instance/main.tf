resource "aws_db_instance" "resource" {
  allocated_storage = 10
  db_name           = var.db_name    # "mydb"
  identifier        = var.identifier # ""

  engine               = var.engine               # "mysql"
  engine_version       = var.engine_version       # "5.7"
  instance_class       = var.instance_class       # "db.t3.micro"
  username             = var.username             # "foo"
  password             = var.password             # "foobarbaz"
  parameter_group_name = var.parameter_group_name # "default.mysql5.7"
  skip_final_snapshot  = var.skip_final_snapshot  # true

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name

  tags = var.aws_resource_tags

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [final_snapshot_identifier]
  }

}

