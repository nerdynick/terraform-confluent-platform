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
  source = "../../modules/shared-cp-aws"
    
  image_id = "ami-01ed306a12b7d1c96"
  zk_servers = 3
  broker_servers = 3
  c3_servers = 1
  ksql_servers = 2
  connect_servers = 2
  rest_servers = 1
  sr_servers = 2
  first_name = var.first_name
  cluster_id = var.cluster_id
  key_pair = var.key_pair
}