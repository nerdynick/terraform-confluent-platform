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
    #Ubuntu 18.04 LTS x64
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
    default = ["bootcamp-cp", "bootcamp-ad"]
}

data "template_file" "cluster_dns_postfix" {
    template = "${lower(join(".", compact([var.cluster_id, var.first_name])))}"
}
data "template_file" "cluster_name_prefix" {
    template = "${lower(join("-", compact([var.first_name, var.cluster_id])))}"
}

###########################
# Zookeeper Vars
###########################
variable "zk_servers" {
    type = number
    default = 1
}
variable "zk_instance_type" {
    type = string
    default = "t3.small"
}
variable "zk_root_volume_size" {
    type = number
    default = 15
}

###########################
# Broker Var
###########################
variable "broker_servers" {
    type = number
    default = 1
}
variable "broker_instance_type" {
    type = string
    default = "t3.medium"
}
variable "broker_root_volume_size" {
    type = number
    default = 30
}

###########################
# C3 Var
###########################
variable "c3_servers" {
    type = number
    default = 0
}
variable "c3_instance_type" {
    type = string
    default = "t3.medium"
}
variable "c3_root_volume_size" {
    type = number
    default = 15
}


###########################
# KSQL Var
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
# Connect Var
###########################
variable "connect_servers" {
    type = number
    default = 0
}
variable "connect_instance_type" {
    type = string
    default = "t3.small"
}
variable "connect_root_volume_size" {
    type = number
    default = 15
}


###########################
# RESTProxy Var
###########################
variable "rest_servers" {
    type = number
    default = 0
}
variable "rest_instance_type" {
    type = string
    default = "t3.small"
}
variable "rest_root_volume_size" {
    type = number
    default = 15
}


###########################
# SchemaReg Var
###########################
variable "sr_servers" {
    type = number
    default = 0
}
variable "sr_instance_type" {
    type = string
    default = "t3.small"
}
variable "sr_root_volume_size" {
    type = number
    default = 15
}