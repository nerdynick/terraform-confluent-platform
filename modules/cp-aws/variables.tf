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
variable "c3_dns_prefix" {
    type = string
    default = "ccc"
}
variable "c3_dns_postfix" {
    type = string
}
variable "c3_dns_ttl" {
    type = "string"
    default = "300"
}

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

