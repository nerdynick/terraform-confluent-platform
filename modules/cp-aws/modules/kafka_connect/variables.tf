###########################
# Connect Vars
###########################
variable "kafka_connect_servers" {
    type = number
    default = 0
}

#Instance Related Vars
variable "kafka_connect_image_id" {
    type = string
}
variable "kafka_connect_instance_type" {
    type = string
    default = "t3.medium"
}
variable "kafka_connect_root_volume_size" {
    type = number
    default = 15
}
variable "kafka_connect_key_pair" {
    type = string
}
variable "kafka_connect_tags" {
    type = map
}

#Network Related Vars
variable "kafka_connect_subnet_id" {
    type = string
}

variable "kafka_connect_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "kafka_connect_dns_zone_id" {
    type = string
}
variable "kafka_connect_dns_prefix" {
    type = string
    default = "connect"
}
variable "kafka_connect_dns_postfix" {
    type = string
}
variable "kafka_connect_dns_ttl" {
    type = "string"
    default = "300"
}