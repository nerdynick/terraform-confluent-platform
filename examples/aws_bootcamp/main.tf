module "aws_cp" {
  source = "../../modules/aws"

  zk_servers = 3
  broker_servers = 3
  c3_servers = 1
  ksql_servers = 2
  connect_servers = 2
  rest_servers = 1
  sr_servers = 2
}