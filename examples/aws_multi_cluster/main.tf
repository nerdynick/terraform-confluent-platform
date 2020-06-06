provider "aws" {
    region = "us-west-2"
}

variable "first_name" {
    type = string
    description = "Your first name. NOTE: No special characters and all in lowercase."
}
variable "key_pair" {
    type = string
    description = "Your KeyPair Name that you have already added to AWS"  
}


module "aws_cp_c1" {
  source = "../../modules/shared-cp-aws"

  zookeeper_servers = 1
  kafka_broker_servers = 3
  control_center_servers = 1
  ksql_servers = 1
  kafka_connect_servers = 1
  rest_proxy_servers = 0
  schema_registry_servers = 1
  
  first_name = var.first_name
  cluster_id = "c1"
  key_pair = var.key_pair
}

module "aws_cp_c2" {
  source = "../../modules/shared-cp-aws"

  zookeeper_servers = 1
  kafka_broker_servers = 3
  control_center_servers = 1
  ksql_servers = 1
  kafka_connect_servers = 1
  rest_proxy_servers = 0
  schema_registry_servers = 1
  
  first_name = var.first_name
  cluster_id = "c2"
  key_pair = var.key_pair
}

module "aws_cp_c3" {
  source = "../../modules/shared-cp-aws"

  zookeeper_servers = 1
  kafka_broker_servers = 0
  control_center_servers = 0
  ksql_servers = 0
  kafka_connect_servers = 0
  rest_proxy_servers = 0
  schema_registry_servers = 0
  
  first_name = var.first_name
  cluster_id = "c3"
  key_pair = var.key_pair
}