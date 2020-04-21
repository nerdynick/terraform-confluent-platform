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
