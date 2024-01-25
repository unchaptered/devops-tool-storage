data "aws_ami" "datasource" {
  most_recent = true
  owners      = var.owners

  dynamic "filter" {
    for_each = var.name != null ? [var.name] : []

    content {
      name   = "name"
      values = filter.value
    }
  }

  dynamic "filter" {
    for_each = var.virtualization-type != null ? [var.virtualization-type] : []

    content {
      name   = "virtualization-type"
      values = filter.value
    }
  }

  dynamic "filter" {
    for_each = var.root-device-type != null ? [var.root-device-type] : []

    content {
      name   = "root-device-type"
      values = filter.value
    }
  }
}
