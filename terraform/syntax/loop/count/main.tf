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
    count = length(var.subnets)
    vpc_id = aws_vpc.aws_vpc.id

    cidr_block = var.subnets[count.index].cidr_block
    tags = {
        Name = var.subnets[count.index].name
    }
}

# [Output]
output "aws_subnet_ids" {
  value = aws_subnet.aws_subnets[*].id
}