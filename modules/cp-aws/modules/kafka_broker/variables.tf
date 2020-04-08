###########################
# Broker Vars
###########################
variable "kafka_broker_servers" {
    type = number
    default = 1
}

#Instance Related Vars
variable "kafka_broker_image_id" {
    type = string
}
variable "kafka_broker_instance_type" {
    type = string
    default = "t3.medium"
}
variable "kafka_broker_root_volume_size" {
    type = number
    default = 30
}
variable "kafka_broker_key_pair" {
    type = string
}
variable "kafka_broker_tags" {
    type = map
}

#Network Related Vars
variable "kafka_broker_subnet_id" {
    type = string
}

variable "kafka_broker_security_groups_ids" {
    type = list
    default = []
}

#DNS Related Vars
variable "kafka_broker_dns_zone_id" {
    type = string
}
variable "kafka_broker_dns_prefix" {
    type = string
    default = "kfk"
}
variable "kafka_broker_dns_postfix" {
    type = string
}
variable "kafka_broker_dns_ttl" {
    type = "string"
    default = "300"
}