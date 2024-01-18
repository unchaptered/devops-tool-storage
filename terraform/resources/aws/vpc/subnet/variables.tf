variable "vpc_id" {
  type        = string
  description = "생성되어있거나 예정 중인 VPC의 id"
}

variable "cidr_block" {
  type        = string
  description = "10.0.0.0/16과 같은 형태의 CIDR 블럭"
}

variable "availability_zone" {
  type        = string
  description = "가용영역"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = <<-DESCRIPTION

  true/false를 통해서 EC2 실행 시, Public IP할당 여부 결정
  - true : 할당
  - false : 미할당 (외부 인터넷 사용을 위해, 별도의 NAT Gateway 등이 필요함)

  DESCRIPTION
}

variable "tags" {
  type = map(any)
}
