module "cp-aws-zookeeper" {
    source = "modules/zookeeper"

    zookeeper_servers = zookeeper_servers
    zookeeper_image_id = zookeeper_image_id
    zookeeper_instance_type = zookeeper_instance_type
    zookeeper_root_volume_size = zookeeper_root_volume_size
    zookeeper_key_pair = zookeeper_key_pair
    zookeeper_tags = zookeeper_tags
    zookeeper_subnet_id = zookeeper_subnet_id
    zookeeper_security_groups_ids = zookeeper_security_groups_ids
    zookeeper_dns_zone_id = zookeeper_dns_zone_id
    zookeeper_dns_prefix = zookeeper_dns_prefix
    zookeeper_dns_postfix = zookeeper_dns_postfix
    zookeeper_dns_ttl = zookeeper_dns_ttl
}

module "cp-aws-kafka_broker" {
    source = "modules/kafka_broker"

    kafka_broker_servers = kafka_broker_servers
    kafka_broker_image_id = kafka_broker_image_id
    kafka_broker_instance_type = kafka_broker_instance_type
    kafka_broker_root_volume_size = kafka_broker_root_volume_size
    kafka_broker_key_pair = kafka_broker_key_pair
    kafka_broker_tags = kafka_broker_tags
    kafka_broker_subnet_id = kafka_broker_subnet_id
    kafka_broker_security_groups_ids = kafka_broker_security_groups_ids
    kafka_broker_dns_zone_id = kafka_broker_dns_zone_id
    kafka_broker_dns_prefix = kafka_broker_dns_prefix
    kafka_broker_dns_postfix = kafka_broker_dns_postfix
    kafka_broker_dns_ttl = kafka_broker_dns_ttl
}

module "cp-aws-control_center" {
    source = "modules/control_center"

    control_center_servers = control_center_servers
    control_center_image_id = control_center_image_id
    control_center_instance_type = control_center_instance_type
    control_center_root_volume_size = control_center_root_volume_size
    control_center_key_pair = control_center_key_pair
    control_center_tags = control_center_tags
    control_center_subnet_id = control_center_subnet_id
    control_center_security_groups_ids = control_center_security_groups_ids
    control_center_dns_zone_id = control_center_dns_zone_id
    control_center_dns_prefix = control_center_dns_prefix
    control_center_dns_postfix = control_center_dns_postfix
    control_center_dns_ttl = control_center_dns_ttl
}

module "cp-aws-kafka_connect" {
    source = "modules/kafka_connect"

    kafka_connect_servers = kafka_connect_servers
    kafka_connect_image_id = kafka_connect_image_id
    kafka_connect_instance_type = kafka_connect_instance_type
    kafka_connect_root_volume_size = kafka_connect_root_volume_size
    kafka_connect_key_pair = kafka_connect_key_pair
    kafka_connect_tags = kafka_connect_tags
    kafka_connect_subnet_id = kafka_connect_subnet_id
    kafka_connect_security_groups_ids = kafka_connect_security_groups_ids
    kafka_connect_dns_zone_id = kafka_connect_dns_zone_id
    kafka_connect_dns_prefix = kafka_connect_dns_prefix
    kafka_connect_dns_postfix = kafka_connect_dns_postfix
    kafka_connect_dns_ttl = kafka_connect_dns_ttl
}

module "cp-aws-ksql" {
    source = "modules/ksql"

    ksql_servers = ksql_servers
    ksql_image_id = ksql_image_id
    ksql_instance_type = ksql_instance_type
    ksql_root_volume_size = ksql_root_volume_size
    ksql_key_pair = ksql_key_pair
    ksql_tags = ksql_tags
    ksql_subnet_id = ksql_subnet_id
    ksql_security_groups_ids = ksql_security_groups_ids
    ksql_dns_zone_id = ksql_dns_zone_id
    ksql_dns_prefix = ksql_dns_prefix
    ksql_dns_postfix = ksql_dns_postfix
    ksql_dns_ttl = ksql_dns_ttl
}

module "cp-aws-rest_proxy" {
    source = "modules/rest_proxy"

    rest_proxy_servers = rest_proxy_servers
    rest_proxy_image_id = rest_proxy_image_id
    rest_proxy_instance_type = rest_proxy_instance_type
    rest_proxy_root_volume_size = rest_proxy_root_volume_size
    rest_proxy_key_pair = rest_proxy_key_pair
    rest_proxy_tags = rest_proxy_tags
    rest_proxy_subnet_id = rest_proxy_subnet_id
    rest_proxy_security_groups_ids = rest_proxy_security_groups_ids
    rest_proxy_dns_zone_id = rest_proxy_dns_zone_id
    rest_proxy_dns_prefix = rest_proxy_dns_prefix
    rest_proxy_dns_postfix = rest_proxy_dns_postfix
    rest_proxy_dns_ttl = rest_proxy_dns_ttl
}

module "cp-aws-schema_registry" {
    source = "modules/schema_registry"

    schema_registry_servers = schema_registry_servers
    schema_registry_image_id = schema_registry_image_id
    schema_registry_instance_type = schema_registry_instance_type
    schema_registry_root_volume_size = schema_registry_root_volume_size
    schema_registry_key_pair = schema_registry_key_pair
    schema_registry_tags = schema_registry_tags
    schema_registry_subnet_id = schema_registry_subnet_id
    schema_registry_security_groups_ids = schema_registry_security_groups_ids
    schema_registry_dns_zone_id = schema_registry_dns_zone_id
    schema_registry_dns_prefix = schema_registry_dns_prefix
    schema_registry_dns_postfix = schema_registry_dns_postfix
    schema_registry_dns_ttl = schema_registry_dns_ttl
}