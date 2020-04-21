module "cp-aws-zookeeper" {
    source = "../base_node"

    servers = servers
    image_id = image_id
    instance_type = instance_type
    root_volume_size = root_volume_size
    key_pair = key_pair
    tags = tags
    subnet_id = subnet_id
    security_groups_ids = security_groups_ids
    dns_zone_id = dns_zone_id
    dns_ttl = dns_ttl
    name_template = name_template
    dns_template = dns_template
}