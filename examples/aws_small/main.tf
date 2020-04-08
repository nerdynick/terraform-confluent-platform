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

module "aws_cp" {
  source = "../../modules/aws_cp"

  zk_servers = 1
  broker_servers = 1
  c3_servers = 1
  ksql_servers = 0
  connect_servers = 1
  rest_servers = 0
  sr_servers = 0
  first_name = var.first_name
  cluster_id = var.cluster_id
  key_pair = var.key_pair
}