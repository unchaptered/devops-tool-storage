variable "owners" {
  type    = list(string)
  default = ["099720109477"]
}

variable "name" {
  type        = list(string)
  default     = null
  description = <<-DESCRIPTION
  Default Value : null
  Reccommendation Value : [\"ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*\"]
  DESCRIPTION
}

variable "virtualization-type" {
  type        = list(string)
  default     = null
  description = <<-DESCRIPTION
  Default Value : null
  Reccommendation Value : [\"hvm\"]
  DESCRIPTION
}

variable "root-device-type" {
  type        = list(string)
  default     = null
  description = <<-DESCRIPTION
  Default Value : null
  Reccommendation Value : [\"ebs\"]
  DESCRIPTION
}
