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

  zk_servers = 1
  broker_servers = 3
  c3_servers = 1
  ksql_servers = 1
  connect_servers = 1
  rest_servers = 0
  sr_servers = 1
  first_name = var.first_name
  cluster_id = "c1"
  key_pair = var.key_pair
}

module "aws_cp_c2" {
  source = "../../modules/shared-cp-aws"

  zk_servers = 1
  broker_servers = 3
  c3_servers = 0
  ksql_servers = 1
  connect_servers = 1
  rest_servers = 0
  sr_servers = 1
  first_name = var.first_name
  cluster_id = "c2"
  key_pair = var.key_pair
}

module "aws_cp_c3" {
  source = "../../modules/shared-cp-aws"

  zk_servers = 1
  broker_servers = 0
  c3_servers = 0
  ksql_servers = 0
  connect_servers = 0
  rest_servers = 0
  sr_servers = 0
  first_name = var.first_name
  cluster_id = "c3"
  key_pair = var.key_pair
}