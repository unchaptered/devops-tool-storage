
variable "name" {
    type = string
}
variable "role_arn" {
    type = string
    sensitive = true
}

variable "vpc_config" {
    type = object({
        subnet_ids = list(string)
        security_group_ids = list(string)
        public_access_cidrs = list(string)
        endpoint_private_access = bool
        endpoint_public_access = bool
    })

    default = {
        subnet_ids = []
        public_access_cidrs = ["0.0.0.0/0"]
        security_group_ids = []

        endpoint_private_access = false
        endpoint_public_access = true
    }
}