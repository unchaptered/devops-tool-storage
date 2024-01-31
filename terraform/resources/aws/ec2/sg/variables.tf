variable "vpc_id" {
  type        = string
  description = "생성되어있거나 예정 중인 VPC의 id"
}

variable "name" {
  type        = string
  description = "AWS Security Group ID (Conosle에 표시)"
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/24"]
    },
    # 추가 Ingress 규칙을 필요에 따라 정의
  ]
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/24"]
    },
    # 추가 Ingress 규칙을 필요에 따라 정의
  ]
}

variable "tags" {
  type = map(any)
}
