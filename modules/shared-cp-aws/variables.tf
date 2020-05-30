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
    type = list
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

variable "zookeeper_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-zk$${format(\"%02.0f\", itemcount)}"
}
variable "zookeeper_dns_template" {
    type = string
    default = "zk$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
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

variable "kafka_broker_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-kfk$${format(\"%02.0f\", itemcount)}"
}
variable "kafka_broker_dns_template" {
    type = string
    default = "kfk$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
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

variable "control_center_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-ccc$${format(\"%02.0f\", itemcount)}"
}
variable "control_center_dns_template" {
    type = string
    default = "ccc$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
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

variable "ksql_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-ksql$${format(\"%02.0f\", itemcount)}"
}
variable "ksql_dns_template" {
    type = string
    default = "ksql$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
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

variable "kafka_connect_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-connect$${format(\"%02.0f\", itemcount)}"
}
variable "kafka_connect_dns_template" {
    type = string
    default = "connect$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
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

variable "rest_proxy_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-rest$${format(\"%02.0f\", itemcount)}"
}
variable "rest_proxy_dns_template" {
    type = string
    default = "rest$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
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

variable "schema_registry_name_template" {
    type = string
    default = "$${lower(join(\"-\", compact([first_name, cluster_id])))}-sr$${format(\"%02.0f\", itemcount)}"
}
variable "schema_registry_dns_template" {
    type = string
    default = "sr$${format(\"%02.0f\", itemcount)}.$${lower(join(\".\", compact([cluster_id, first_name, cloud])))}"
}