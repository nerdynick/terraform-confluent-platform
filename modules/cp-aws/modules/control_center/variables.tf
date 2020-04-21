###########################
# C3 Vars
###########################
variable "c3_servers" {
    type = number
    default = 0
}

#Instance Related Vars
variable "c3_image_id" {
    type = string
}
variable "c3_instance_type" {
    type = string
    default = "t3.medium"
}
variable "c3_root_volume_size" {
    type = number
    default = 15
}
variable "c3_key_pair" {
    type = string
}
variable "c3_tags" {
    type = map
}

#Network Related Vars
variable "c3_subnet_id" {
    type = string
}

variable "c3_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "c3_dns_zone_id" {
    type = string
}
variable "c3_dns_postfix" {
    type = string
}
variable "c3_dns_ttl" {
    type = "string"
    default = "300"
}

variable "c3_name_template" {
    type = "string"
    default = "ccc${format("%02f", count)}"
}
variable "c3_dns_template" {
    type = "string"
    default = "${name}"
}