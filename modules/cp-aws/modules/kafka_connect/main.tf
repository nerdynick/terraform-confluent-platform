###########################
# Connect Resources
###########################
data "template_file" "kafka_connect_name_prefix" {
    template = "${lower(join("-", compact([var.c3_dns_postfix, var.c3_dns_prefix])))}"
}
resource "aws_instance" "kafka_connect" {
    count           = var.kafka_connect_servers
    ami             = var.kafka_connect_image_id
    instance_type   = var.kafka_connect_instance_type
    key_name        = var.kafka_connect_key_pair
    subnet_id       = var.kafka_connect_subnet_id
    vpc_security_group_ids = var.kafka_connect_security_groups_ids
    
    tags = merge(var.c3_tags, {"name"="${data.kafka_connect_name_prefix.rendered}-${count.index+1}", "Name"="${data.kafka_connect_name_prefix.rendered}-${count.index+1}"})
    volume_tags = merge(var.c3_tags, {"name"="${data.kafka_connect_name_prefix.rendered}-${count.index+1}", "Name"="${data.kafka_connect_name_prefix.rendered}-${count.index+1}"})
  
    root_block_device {
        volume_size = var.kafka_connect_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "kafka_connect" {
    count   = var.kafka_connect_servers
    zone_id = var.kafka_connect_dns_zone_id
    name    = "${kafka_connect_dns_prefix}${count.index+1}.${var.kafka_connect_dns_postfix}"
    type    = "CNAME"
    ttl     = var.kafka_connect_dns_ttl
    records = [element(aws_instance.kafka_connect.*.public_dns, count.index)]
}