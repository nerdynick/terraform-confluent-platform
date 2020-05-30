provider "aws" {
    region = "us-west-2"
}

variable "first_name" {
    type = string
    description = "Your first name. NOTE: No special characters and all in lowercase."
}
variable "cluster_id" {
    type = string
    default = ""
    description = "If you're wishing to have multiple clusters running at a single time. You can define a unique string here. NOTE: No special chars and all in lowercase."
}
variable "key_pair" {
    type = string
    description = "Your KeyPair Name that you have already added to AWS"  
}

module "cp" {
  source = "../../modules/shared-cp-aws"

  zookeeper_servers = 1
  kafka_broker_servers = 1
  control_center_servers = 1
  ksql_servers = 1
  kafka_connect_servers = 1
  rest_proxy_servers = 1
  schema_registry_servers = 1
  first_name = var.first_name
  cluster_id = var.cluster_id
  key_pair = var.key_pair
}