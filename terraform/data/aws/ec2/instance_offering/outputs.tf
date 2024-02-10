output "instance_type" {
  sensitive = false
  value     = data.aws_ec2_instance_type_offerings.datasource.instance_types[0]
}
