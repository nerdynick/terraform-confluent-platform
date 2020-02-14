provider "aws" {
    region = "us-west-2"
}

data "aws_vpc" "bootcamp" {
#   id = "vpc-047944e470c1d51db"
    filter {
        name = "tag:Name"
        values = ["vpc-bootcamp"]
    }
}

data "aws_security_groups" "bootcamp" {
  filter {
    name   = "group-name"
    values = concat(var.security_groups, var.default_security_groups)
  }
  
  filter {
    name   = "vpc-id"
    values = ["vpc-047944e470c1d51db"]
  }
}

data "aws_subnet" "subnet_a" {
    vpc_id  = data.aws_vpc.bootcamp.id
    filter {
        name = "availability-zone"
        values = ["us-west-2a"]
    }
}
data "aws_subnet" "subnet_b" {
    vpc_id  = data.aws_vpc.bootcamp.id
    filter {
        name = "availability-zone"
        values = ["us-west-2b"]
    }
}
data "aws_subnet" "subnet_c" {
    vpc_id  = data.aws_vpc.bootcamp.id
    filter {
        name = "availability-zone"
        values = ["us-west-2c"]
    }
}

data "aws_route53_zone" "public" {
    name = "ps.confluent.io"
}

data "aws_route53_zone" "private" {
    name = "ps.confluent-internal.io"
}

###########################
# Zookeeper Resources
###########################
resource "aws_instance" "zookeeper" {
    count           = var.zk_servers
    ami             = var.image_id
    instance_type   = var.zk_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-zk${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.zk_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "zookeeper" {
    count   = var.zk_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "zk${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.zookeeper.*.public_dns, count.index)]
}


###########################
# Broker Resources
###########################
resource "aws_instance" "broker" {
    count           = var.broker_servers
    ami             = var.image_id
    instance_type   = var.broker_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-kfk${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.broker_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "broker" {
    count   = var.broker_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "kfk${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.broker.*.public_dns, count.index)]
}

###########################
# C3 Resources
###########################
resource "aws_instance" "c3" {
    count           = var.c3_servers
    ami             = var.image_id
    instance_type   = var.c3_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-c3${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.c3_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "c3" {
    count   = var.c3_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "ccc${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.c3.*.public_dns, count.index)]
}

###########################
# KSQL Resources
###########################
resource "aws_instance" "ksql" {
    count           = var.ksql_servers
    ami             = var.image_id
    instance_type   = var.ksql_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-ksql${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.ksql_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "ksql" {
    count   = var.ksql_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "ksql${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.ksql.*.public_dns, count.index)]
}

###########################
# Connect Resources
###########################
resource "aws_instance" "connect" {
    count           = var.connect_servers
    ami             = var.image_id
    instance_type   = var.connect_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-connect${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.connect_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "connect" {
    count   = var.connect_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "connect${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.connect.*.public_dns, count.index)]
}

###########################
# RESTProxy Resources
###########################
resource "aws_instance" "rest" {
    count           = var.rest_servers
    ami             = var.image_id
    instance_type   = var.rest_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-rest${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.rest_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "rest" {
    count   = var.rest_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "rest${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.rest.*.public_dns, count.index)]
}

###########################
# SchemaReg Resources
###########################
resource "aws_instance" "sr" {
    count           = var.sr_servers
    ami             = var.image_id
    instance_type   = var.sr_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-sr${count.index+1}"
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
    
    volume_tags = {
        Owner = var.first_name
        owner = var.first_name
        SA = var.first_name
        sa = var.first_name
    }
  
    root_block_device {
        volume_size = var.sr_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "sr" {
    count   = var.sr_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "sr${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.sr.*.public_dns, count.index)]
}