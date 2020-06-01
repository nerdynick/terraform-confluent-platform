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
    version = "2.1.1"
    
    extra_template_vars = {
        cluster_id: var.cluster_id,
        first_name: var.first_name,
        cloud: "aws"
    }
    default_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    vpc_id = data.aws_vpc.shared_vpc.id
    subnet_id = data.aws_subnet.shared_subnet_a.id
    image_id = var.image_id
    key_pair = var.key_pair
    enable_sg_creation = false
    dns_zone_id = data.aws_route53_zone.public.zone_id

    zookeeper_servers = var.zookeeper_servers
    zookeeper_instance_type = var.zookeeper_instance_type
    zookeeper_root_volume_size = var.zookeeper_root_volume_size
    zookeeper_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    zookeeper_name_template = var.zookeeper_name_template
    zookeeper_dns_template = var.zookeeper_dns_template
    zookeeper_enable_sg_creation = var.zookeeper_servers > 0 ? true : false
    

    kafka_broker_servers = var.kafka_broker_servers
    kafka_broker_instance_type = var.kafka_broker_instance_type
    kafka_broker_root_volume_size = var.kafka_broker_root_volume_size
    kafka_broker_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    kafka_broker_name_template = var.kafka_broker_name_template
    kafka_broker_dns_template = var.kafka_broker_dns_template
    kafka_broker_enable_sg_creation = var.kafka_broker_servers > 0 ? true : false

    kafka_connect_servers = var.kafka_connect_servers
    kafka_connect_instance_type = var.kafka_connect_instance_type
    kafka_connect_root_volume_size = var.kafka_connect_root_volume_size
    kafka_connect_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    kafka_connect_name_template = var.kafka_connect_name_template
    kafka_connect_dns_template = var.kafka_connect_dns_template
    kafka_connect_enable_sg_creation = var.kafka_connect_servers > 0 ? true : false

    control_center_servers = var.control_center_servers
    control_center_instance_type = var.control_center_instance_type
    control_center_root_volume_size = var.control_center_root_volume_size
    control_center_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    control_center_name_template = var.control_center_name_template
    control_center_dns_template = var.control_center_dns_template
    control_center_enable_sg_creation = var.control_center_servers > 0 ? true : false

    ksql_servers = var.ksql_servers
    ksql_instance_type = var.ksql_instance_type
    ksql_root_volume_size = var.ksql_root_volume_size
    ksql_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    ksql_name_template = var.ksql_name_template
    ksql_dns_template = var.ksql_dns_template
    ksql_enable_sg_creation = var.ksql_servers > 0 ? true : false

    rest_proxy_servers = var.rest_proxy_servers
    rest_proxy_instance_type = var.rest_proxy_instance_type
    rest_proxy_root_volume_size = var.rest_proxy_root_volume_size
    rest_proxy_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    rest_proxy_name_template = var.rest_proxy_name_template
    rest_proxy_dns_template = var.rest_proxy_dns_template
    rest_proxy_enable_sg_creation = var.rest_proxy_servers > 0 ? true : false

    schema_registry_servers = var.schema_registry_servers
    schema_registry_instance_type = var.schema_registry_instance_type
    schema_registry_root_volume_size = var.schema_registry_root_volume_size
    schema_registry_security_groups_ids = data.aws_security_groups.shared_sgs.ids
    schema_registry_name_template = var.schema_registry_name_template
    schema_registry_dns_template = var.schema_registry_dns_template
    schema_registry_enable_sg_creation = var.schema_registry_servers > 0 ? true : false
}