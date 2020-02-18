data "aws_vpc" "bootcamp" {
    filter {
        name = "tag:Name"
        values = ["vpc-bootcamp"]
    }
}

data "aws_subnet" "subnet_a" {
    vpc_id  = data.aws_vpc.bootcamp.id
    filter {
        name = "tag:Name"
        values = ["vpc-bootcamp-a"]
    }
}
data "aws_subnet" "subnet_b" {
    vpc_id  = data.aws_vpc.bootcamp.id
    filter {
        name = "tag:Name"
        values = ["vpc-bootcamp-a"]
    }
}
data "aws_subnet" "subnet_c" {
    vpc_id  = data.aws_vpc.bootcamp.id
    filter {
        name = "tag:Name"
        values = ["vpc-bootcamp-a"]
    }
}

data "aws_security_groups" "bootcamp" {
  filter {
    name   = "group-name"
    values = concat(var.security_groups, var.default_security_groups)
  }
  
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.bootcamp.id]
  }
}

data "aws_route53_zone" "public" {
    name = "ps.confluent.io"
}

data "aws_route53_zone" "private" {
    name = "ps.confluent-internal.io"
}

###########################
# Splunk Resources
###########################
resource "aws_instance" "splunk" {
    count           = var.splunk_servers
    ami             = var.image_id
    instance_type   = var.splunk_instance_type
    key_name        = var.key_pair
    subnet_id       = data.aws_subnet.subnet_a.id
    vpc_security_group_ids = data.aws_security_groups.bootcamp.ids
    

    tags = {
        Name = "${data.template_file.cluster_name_prefix.rendered}-splunk${count.index+1}"
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
        volume_size = var.splunk_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "splunk" {
    count   = var.splunk_servers
    zone_id = data.aws_route53_zone.public.zone_id
    name    = "splunk${count.index+1}.${data.template_file.cluster_dns_postfix.rendered}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(aws_instance.splunk.*.public_dns, count.index)]
}