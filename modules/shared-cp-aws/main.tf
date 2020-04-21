data "aws_vpc" "shared_vpc" {
    filter {
        name = "tag:Name"
        values = [var.vpc]
    }
}

data "aws_subnet" "shared_subnet_a" {
    vpc_id  = data.aws_vpc.shared_vpc.id
    filter {
        name = "tag:Name"
        values = [vpc.subnet_a]
    }
}
data "aws_subnet" "shared_subnet_b" {
    vpc_id  = data.aws_vpc.shared_vpc.id
    filter {
        name = "tag:Name"
        values = [var.subnet_b]
    }
}
data "aws_subnet" "shared_subnet_c" {
    vpc_id  = data.aws_vpc.shared_vpc.id
    filter {
        name = "tag:Name"
        values = [var.subnet_c]
    }
}

data "aws_security_groups" "shared_sgs" {
  filter {
    name   = "group-name"
    values = concat(var.security_groups, var.default_security_groups)
  }
  
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shared_vpc.id]
  }
}

data "aws_route53_zone" "public" {
    name = var.dns_public
}

data "aws_route53_zone" "private" {
    name = var.dns_private
}


module "shared-cp-aws" {
    source = "cp-aws"

    zookeeper_servers = var.zookeeper_servers
    zookeeper_instance_type = var.zookeeper_instance_type
    zookeeper_root_volume_size = var.zookeeper_root_volume_size
    zookeeper_image_id = var.image_id
    zookeeper_key_pair = var.key_pair
    zookeeper_tags = var.default_tags
    zookeeper_subnet_id = data.aws_subnet.shared_subnet_a.id
    zookeeper_security_groups_ids = data.aws_security_groups.shared_sgs
    zookeeper_dns_zone_id = data.aws_route53_zone.public.zone_id
    zookeeper_dns_postfix = data.cluster_dns_postfix.rendered

    kafka_broker_servers = var.kafka_broker_servers
    kafka_broker_instance_type = var.kafka_broker_instance_type
    kafka_broker_root_volume_size = var.kafka_broker_root_volume_size
    kafka_broker_image_id = var.image_id
    kafka_broker_key_pair = var.key_pair
    kafka_broker_tags = var.default_tags
    kafka_broker_subnet_id = data.aws_subnet.shared_subnet_a.id
    kafka_broker_security_groups_ids = data.aws_security_groups.shared_sgs
    kafka_broker_dns_zone_id = data.aws_route53_zone.public.zone_id
    kafka_broker_dns_postfix = data.cluster_dns_postfix.rendered

    control_center_servers = var.control_center_servers
    control_center_instance_type = var.control_center_instance_type
    control_center_root_volume_size = var.control_center_root_volume_size
    control_center_image_id = var.image_id
    control_center_key_pair = var.key_pair
    control_center_tags = var.default_tags
    control_center_subnet_id = data.aws_subnet.shared_subnet_a.id
    control_center_security_groups_ids = data.aws_security_groups.shared_sgs
    control_center_dns_zone_id = data.aws_route53_zone.public.zone_id
    control_center_dns_postfix = data.cluster_dns_postfix.rendered

    kafka_connect_servers = var.kafka_connect_servers
    kafka_connect_instance_type = var.kafka_connect_instance_type
    kafka_connect_root_volume_size = var.kafka_connect_root_volume_size
    kafka_connect_image_id = var.image_id
    kafka_connect_key_pair = var.key_pair
    kafka_connect_tags = var.default_tags
    kafka_connect_subnet_id = data.aws_subnet.shared_subnet_a.id
    kafka_connect_security_groups_ids = data.aws_security_groups.shared_sgs
    kafka_connect_dns_zone_id = data.aws_route53_zone.public.zone_id
    kafka_connect_dns_postfix = data.cluster_dns_postfix.rendered

    rest_proxy_servers = var.rest_proxy_servers
    rest_proxy_instance_type = var.rest_proxy_instance_type
    rest_proxy_root_volume_size = var.rest_proxy_root_volume_size
    rest_proxy_image_id = var.image_id
    rest_proxy_key_pair = var.key_pair
    rest_proxy_tags = var.default_tags
    rest_proxy_subnet_id = data.aws_subnet.shared_subnet_a.id
    rest_proxy_security_groups_ids = data.aws_security_groups.shared_sgs
    rest_proxy_dns_zone_id = data.aws_route53_zone.public.zone_id
    rest_proxy_dns_postfix = data.cluster_dns_postfix.rendered

    schema_registry_servers = var.schema_registry_servers
    schema_registry_instance_type = var.schema_registry_instance_type
    schema_registry_root_volume_size = var.schema_registry_root_volume_size
    schema_registry_image_id = var.image_id
    schema_registry_key_pair = var.key_pair
    schema_registry_tags = var.default_tags
    schema_registry_subnet_id = data.aws_subnet.shared_subnet_a.id
    schema_registry_security_groups_ids = data.aws_security_groups.shared_sgs
    schema_registry_dns_zone_id = data.aws_route53_zone.public.zone_id
    schema_registry_dns_postfix = data.cluster_dns_postfix.rendered

    ksql_servers = var.ksql_servers
    ksql_instance_type = var.ksql_instance_type
    ksql_root_volume_size = var.ksql_root_volume_size
    ksql_image_id = var.image_id
    ksql_key_pair = var.key_pair
    ksql_tags = var.default_tags
    ksql_subnet_id = data.aws_subnet.shared_subnet_a.id
    ksql_security_groups_ids = data.aws_security_groups.shared_sgs
    ksql_dns_zone_id = data.aws_route53_zone.public.zone_id
    ksql_dns_postfix = data.cluster_dns_postfix.rendered
}