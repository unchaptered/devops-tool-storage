data "aws_ec2_instance_type_offerings" "datasource" {

  dynamic "filter" {
    for_each = var.instance_type_filter != null ? [var.instance_type_filter] : []

    content {
      name   = "instance-type"
      values = filter.values
    }
  }

  dynamic "filter" {
    for_each = var.location_filter != null ? [var.location_filter] : []

    content {
      name   = "location"
      values = filter.values
    }
  }
}
