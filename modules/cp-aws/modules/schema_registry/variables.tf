###########################
# SchemaReg Vars
###########################
variable "sr_servers" {
    type = number
    default = 0
}

#Instance Related Vars
variable "sr_image_id" {
    type = string
}
variable "sr_instance_type" {
    type = string
    default = "t3.small"
}
variable "sr_root_volume_size" {
    type = number
    default = 15
}
variable "sr_key_pair" {
    type = string
}
variable "sr_tags" {
    type = map
}

#Network Related Vars
variable "sr_subnet_id" {
    type = string
}

variable "sr_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "sr_dns_zone_id" {
    type = string
}
variable "sr_dns_prefix" {
    type = string
    default = "sr"
}
variable "sr_dns_postfix" {
    type = string
}
variable "sr_dns_ttl" {
    type = "string"
    default = "300"
}