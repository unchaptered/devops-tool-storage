# [Variable]
variable "profile" {
  type = string
  default = "eksprac"
}

variable "subnets" {
    type = list(object({
        name = string
        cidr_block = string
    }))
    default = [
        {
            name = "subnet-1"
            cidr_block = "30.0.1.0/24"
        },
        {
            name = "subnet-5"
            cidr_block = "30.0.2.0/24"
        },
        {
            name = "subnet-3"
            cidr_block = "30.0.3.0/24"
        }
    ]
}

# [Provider]
provider "aws" {
    profile = var.profile
}

# [Resource]
resource "aws_vpc" "aws_vpc" {
    cidr_block = "30.0.0.0/16"
}

resource "aws_subnet" "aws_subnets" {
    for_each = { for subnet in var.subnets : subnet.name => subnet.cidr_block }
    vpc_id = aws_vpc.aws_vpc.id

    cidr_block = each.value
    tags = {
        Name = each.key
    }
}

# [Output]
output "aws_subnet_ids" {
  value = { for k, v in aws_subnet.aws_subnets : v.tags.Name => v.id }
}