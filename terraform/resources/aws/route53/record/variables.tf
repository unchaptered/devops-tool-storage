variable "zone_id" {
  type        = string
  description = "AWS Route53 Hosting Zone 의 고유식별자 Id"
}
variable "record_name" {
  type        = string
  description = <<-DESCRIPTION
    AWS Route53 Record의 DNS Record Name
    - ex ) www.example.com
    - ex ) example.com
  DESCRIPTION
}
variable "type" {
  type        = string
  description = <<-DESCRIPTION
    AWS Route53 Record의 DNS Record Type
    - 허용 레코드 : A
  DESCRIPTION

  validation {
    condition     = can(regex("^(A)$", var.type))
    error_message = "Invalid type, only allowed are : 'A'"
  }
}
variable "ttl" {
  default     = null
  type        = string
  description = <<-DESCRIPTION
    AWS Route53 Record의 DNS Record TTL
    - var.aliases의 값이 존재할때는 ttl은 null 이어야 함
  DESCRIPTION
}

variable "records" {
  default     = null
  type        = list(string)
  description = <<-DESCRIPTION
    AWS Route53 Record의 DNS Record List
    - var.aliases의 값이 존재할때는 records은 null 이어야 함
  DESCRIPTION
}

variable "aliases" {
  default = null
  type = list(object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  }))
  description = <<-DESCRIPTION
    AWS Route53 Record의 Alias List
    - var.aliases값이 존재하면 type, ttl은 null 이어야 함
  DESCRIPTION
}
