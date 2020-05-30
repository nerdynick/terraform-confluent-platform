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
        values = [var.subnet_a]
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
    #source = "./../terraform-aws-confluent-platform"
    source  = "nerdynick/confluent-platform/aws"
    version = "1.0.0"
    
    extra_template_vars = {
        cluster_id: var.cluster_id,
        first_name: var.first_name,
        cloud: "aws"
    }

    zookeeper_servers = var.zookeeper_servers
    zookeeper_instance_type = var.zookeeper_instance_type
    zookeeper_root_volume_size = var.zookeeper_root_volume_size
    zookeeper_image_id = var.image_id
    zookeeper_key_pair = var.key_pair
    zookeeper_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    zookeeper_subnet_id = data.aws_subnet.shared_subnet_a.id
    zookeeper_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    zookeeper_dns_zone_id = data.aws_route53_zone.public.zone_id
    zookeeper_name_template = var.zookeeper_name_template
    zookeeper_dns_template = var.zookeeper_dns_template
    

    kafka_broker_servers = var.kafka_broker_servers
    kafka_broker_instance_type = var.kafka_broker_instance_type
    kafka_broker_root_volume_size = var.kafka_broker_root_volume_size
    kafka_broker_image_id = var.image_id
    kafka_broker_key_pair = var.key_pair
    kafka_broker_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    kafka_broker_subnet_id = data.aws_subnet.shared_subnet_a.id
    kafka_broker_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    kafka_broker_dns_zone_id = data.aws_route53_zone.public.zone_id
    kafka_broker_name_template = var.kafka_broker_name_template
    kafka_broker_dns_template = var.kafka_broker_dns_template

    kafka_connect_servers = var.kafka_connect_servers
    kafka_connect_instance_type = var.kafka_connect_instance_type
    kafka_connect_root_volume_size = var.kafka_connect_root_volume_size
    kafka_connect_image_id = var.image_id
    kafka_connect_key_pair = var.key_pair
    kafka_connect_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    kafka_connect_subnet_id = data.aws_subnet.shared_subnet_a.id
    kafka_connect_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    kafka_connect_dns_zone_id = data.aws_route53_zone.public.zone_id
    kafka_connect_name_template = var.kafka_connect_name_template
    kafka_connect_dns_template = var.kafka_connect_dns_template

    control_center_servers = var.control_center_servers
    control_center_instance_type = var.control_center_instance_type
    control_center_root_volume_size = var.control_center_root_volume_size
    control_center_image_id = var.image_id
    control_center_key_pair = var.key_pair
    control_center_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    control_center_subnet_id = data.aws_subnet.shared_subnet_a.id
    control_center_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    control_center_dns_zone_id = data.aws_route53_zone.public.zone_id
    control_center_name_template = var.control_center_name_template
    control_center_dns_template = var.control_center_dns_template

    ksql_servers = var.ksql_servers
    ksql_instance_type = var.ksql_instance_type
    ksql_root_volume_size = var.ksql_root_volume_size
    ksql_image_id = var.image_id
    ksql_key_pair = var.key_pair
    ksql_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    ksql_subnet_id = data.aws_subnet.shared_subnet_a.id
    ksql_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    ksql_dns_zone_id = data.aws_route53_zone.public.zone_id
    ksql_name_template = var.ksql_name_template
    ksql_dns_template = var.ksql_dns_template

    rest_proxy_servers = var.rest_proxy_servers
    rest_proxy_instance_type = var.rest_proxy_instance_type
    rest_proxy_root_volume_size = var.rest_proxy_root_volume_size
    rest_proxy_image_id = var.image_id
    rest_proxy_key_pair = var.key_pair
    rest_proxy_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    rest_proxy_subnet_id = data.aws_subnet.shared_subnet_a.id
    rest_proxy_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    rest_proxy_dns_zone_id = data.aws_route53_zone.public.zone_id
    rest_proxy_name_template = var.rest_proxy_name_template
    rest_proxy_dns_template = var.rest_proxy_dns_template

    schema_registry_servers = var.schema_registry_servers
    schema_registry_instance_type = var.schema_registry_instance_type
    schema_registry_root_volume_size = var.schema_registry_root_volume_size
    schema_registry_image_id = var.image_id
    schema_registry_key_pair = var.key_pair
    schema_registry_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    schema_registry_subnet_id = data.aws_subnet.shared_subnet_a.id
    schema_registry_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    schema_registry_dns_zone_id = data.aws_route53_zone.public.zone_id
    schema_registry_name_template = var.schema_registry_name_template
    schema_registry_dns_template = var.schema_registry_dns_template
}