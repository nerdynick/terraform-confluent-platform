###########################
# Zookeeper Vars
###########################
variable "zk_servers" {
    type = number
    default = 1
}

#Instance Related Vars
variable "zk_image_id" {
    type = string
}
variable "zk_instance_type" {
    type = string
    default = "t3.small"
}
variable "zk_root_volume_size" {
    type = number
    default = 15
}
variable "zk_key_pair" {
    type = string
}
variable "zk_tags" {
    type = map
}

#Network Related Vars
variable "zk_subnet_id" {
    type = string
}

variable "zk_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "zk_dns_zone_id" {
    type = string
}
variable "zk_dns_prefix" {
    type = string
    default = "zk"
}
variable "zk_dns_postfix" {
    type = string
}
variable "zk_dns_ttl" {
    type = "string"
    default = "300"
}