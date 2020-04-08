###########################
# KSQL Vars
###########################
variable "ksql_servers" {
    type = number
    default = 0
}

#Instance Related Vars
variable "ksql_image_id" {
    type = string
}
variable "ksql_instance_type" {
    type = string
    default = "t3.small"
}
variable "ksql_root_volume_size" {
    type = number
    default = 15
}
variable "ksql_key_pair" {
    type = string
}
variable "ksql_tags" {
    type = map
}

#Network Related Vars
variable "ksql_subnet_id" {
    type = string
}

variable "ksql_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "ksql_dns_zone_id" {
    type = string
}
variable "ksql_dns_prefix" {
    type = string
    default = "ksql"
}
variable "ksql_dns_postfix" {
    type = string
}
variable "ksql_dns_ttl" {
    type = "string"
    default = "300"
}