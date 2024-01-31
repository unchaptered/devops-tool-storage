provider "aws" {
  profile = var.profile
  region  = var.region
}
variable "profile" {
  type        = string
  description = "aws configuration profile name"
}

variable "region" {
  type        = string
  description = "aws configuration region name"
}
