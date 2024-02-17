# [Provider]
variable "profile" {
  type        = string
  description = "aws configuration profile name"
}

variable "region" {
  type        = string
  description = "aws configuration region name"
}


# [Structure]
variable "prefix" {
  type        = string
  description = <<-DESCRIPTION
  Generally, prefix contains "service" and "stage"

  - service must be 2~5, for example : "kevin"
  - stage must be 2~5, for example : ["prod", "dev", "stage", "test"]
  - prefix for examples : ["kevin-prod", "kevin-dev", "kevin-stage", "kevin-test"]
  DESCRIPTION

  validation {
    condition     = can(regex("^[a-z\\-]{4,11}$", var.prefix))
    error_message = "var.prefix must be 10 with lowercase eng"
  }
}

variable "suffix" {
  type        = string
  description = <<-DESCRIPTION
  Generally, suffix contains "region_name"

  - regaion_name
  - Best : "ap-ne-2"
  - Worst : "ap-northeast-2"
  DESCRIPTION

  validation {
    condition     = can(regex("^[a-z0-9\\-]{4,71}$", var.suffix))
    error_message = "var.suffix must be 10 with lowercase eng"
  }
}

# [Resource]
variable "vpc_cidr_block" { type = string }
variable "vpc_tags" { type = map(any) }


variable "vpc_public_subnet_cidrs" {
  type = map(object({
    cidr_block        = string,
    availability_zone = string,
  }))
}
variable "vpc_public_subnet_tags" { type = map(any) }

variable "vpc_private_subnet_cidrs" {
  type = map(object({
    cidr_block        = string,
    availability_zone = string,
  }))
}
variable "vpc_private_subnet_tags" { type = map(any) }

variable "vpc_igw_tags" { type = map(any) }
variable "vpc_nat_eip_tags" { type = map(any) }
variable "vpc_nat_tags" { type = map(any) }