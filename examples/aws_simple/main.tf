module "aws_cp" {
  source = "../../modules/aws"

  zk_servers = 3
  broker_servers = 3
  c3_servers = 1
  ksql_servers = 0
  connect_servers = 0
  rest_servers = 0
  sr_servers = 0
}