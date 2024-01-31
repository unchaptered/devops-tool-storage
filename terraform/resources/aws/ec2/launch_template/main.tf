resource "aws_launch_template" "resource" {
  name                   = var.name          # "'"
  image_id               = var.image_id      # "ubutnu 20.04의 AMI id"
  instance_type          = var.instance_type # "t2.micro"
  vpc_security_group_ids = var.security_group_ids

  # security_group_names = var.security_group_ids # 
  # 이런 쓰레기같은 매개변수를 쓰면 버그가 걸립니다. Kevin
  # 버그 내용 참고 :ㅣ  https://github.com/aws/aws-sdk/issues/401

  key_name = var.key_name # "pem key"

  tags = var.tags

  iam_instance_profile {
    arn = var.iam_instance_profile_arn
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tag_specifications_tags
  }

  block_device_mappings {
    device_name = var.block_device_mappings_device_name #"/dev/sda1"

    ebs {
      volume_size           = var.block_device_mappings_ebs_volume_size           #32
      volume_type           = var.block_device_mappings_ebs_volume_type           #"gp3"
      delete_on_termination = var.block_device_mappings_ebs_delete_on_termination # true
      encrypted             = var.block_device_mappings_ebs_encrypted             # false
    }
  }

}
