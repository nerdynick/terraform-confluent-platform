variable "first_name" {
    type = string
    description = "Your first name. NOTE: No special characters and all in lowercase."
}
variable "cluster_id" {
    type = string
    default = ""
    description = "If you're wishing to have multiple clusters running at a single time. You can define a unique string here. NOTE: No special chars and all in lowercase."
}
variable "image_id" {
    type = string
    #Ubuntu 18.04 LTS x64: ami-06d51e91cea0dac8d
    # CentOS 7 X64:        ami-01ed306a12b7d1c96
    default = "ami-06d51e91cea0dac8d"
}
variable "key_pair" {
    type = string
    description = "Your KeyPair Name that you have already added to AWS"  
}
variable "security_groups" {
    type = list
    default = []
}
variable "default_security_groups" {
    default = ["bootcamp-cp", "bootcamp-cp-jmx", "bootcamp-ad"]
}

variable "vpc" {
    default = "vpc-bootcamp"
}
variable "subnet_a" {
    default = "vpc-bootcamp-a"
}
variable "subnet_b" {
    default = "vpc-bootcamp-b"
}
variable "subnet_c" {
    default = "vpc-bootcamp-c"
}

variable "dns_public" {
    default = "ps.confluent.io"
}

variable "dns_private" {
    default = "ps.confluent-internal.io"
}

variable "default_tags" {
    type = map
    default = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
}

###########################
# Derived Vars
###########################
data "template_file" "cluster_dns_postfix" {
    template = "${lower(join(".", compact([var.cluster_id, var.first_name, "aws"])))}"
}
data "template_file" "cluster_name_prefix" {
    template = "${lower(join("-", compact([var.first_name, var.cluster_id])))}"
}

###########################
# Zookeeper Vars
###########################
variable "zookeeper_servers" {
    type = number
    default = 1
}
variable "zookeeper_instance_type" {
    type = string
    default = "t3.small"
}
variable "zookeeper_root_volume_size" {
    type = number
    default = 15
}

###########################
# Broker Vars
###########################
variable "kafka_broker_servers" {
    type = number
    default = 1
}
variable "kafka_broker_instance_type" {
    type = string
    default = "t3.medium"
}
variable "kafka_broker_root_volume_size" {
    type = number
    default = 30
}

###########################
# C3 Vars
###########################
variable "control_center_servers" {
    type = number
    default = 0
}
variable "control_center_instance_type" {
    type = string
    default = "t3.medium"
}
variable "control_center_root_volume_size" {
    type = number
    default = 15
}


###########################
# KSQL Vars
###########################
variable "ksql_servers" {
    type = number
    default = 0
}
variable "ksql_instance_type" {
    type = string
    default = "t3.small"
}
variable "ksql_root_volume_size" {
    type = number
    default = 15
}


###########################
# Connect Vars
###########################
variable "kafka_connect_servers" {
    type = number
    default = 0
}
variable "kafka_connect_instance_type" {
    type = string
    default = "t3.medium"
}
variable "kafka_connect_root_volume_size" {
    type = number
    default = 15
}


###########################
# RESTProxy Vars
###########################
variable "rest_proxy_servers" {
    type = number
    default = 0
}
variable "rest_proxy_instance_type" {
    type = string
    default = "t3.small"
}
variable "rest_proxy_root_volume_size" {
    type = number
    default = 15
}


###########################
# SchemaReg Vars
###########################
variable "schema_registry_servers" {
    type = number
    default = 0
}
variable "schema_registry_instance_type" {
    type = string
    default = "t3.small"
}
variable "schema_registry_root_volume_size" {
    type = number
    default = 15
}