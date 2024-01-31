resource "aws_autoscaling_group" "resource" {
  name             = var.name
  desired_capacity = var.desired_capacity # 0
  max_size         = var.max_size         # 0
  min_size         = var.min_size         # 0
  # availability_zones  = ["ap-northeast-2"]
  vpc_zone_identifier = var.vpc_zone_identifier # []

  # health_check_type    = "EC2"
  # termination_policies = ["OldestInstance"]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "resource" {
  lb_target_group_arn    = var.lb_target_group_arn # aws_lb_target_group.example.arn
  autoscaling_group_name = aws_autoscaling_group.resource.name
}
