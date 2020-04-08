###########################
# RESTProxy Vars
###########################
variable "rest_servers" {
    type = number
    default = 0
}

#Instance Related Vars
variable "rest_image_id" {
    type = string
}
variable "rest_instance_type" {
    type = string
    default = "t3.small"
}
variable "rest_root_volume_size" {
    type = number
    default = 15
}
variable "rest_key_pair" {
    type = string
}
variable "rest_tags" {
    type = map
}

#Network Related Vars
variable "rest_subnet_id" {
    type = string
}

variable "rest_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "rest_dns_zone_id" {
    type = string
}
variable "rest_dns_prefix" {
    type = string
    default = "rest"
}
variable "rest_dns_postfix" {
    type = string
}
variable "rest_dns_ttl" {
    type = "string"
    default = "300"
}