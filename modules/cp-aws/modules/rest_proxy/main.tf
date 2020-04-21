###########################
# RESTProxy Resources
###########################
data "template_file" "rest_name_prefix" {
    template = "${lower(join("-", compact([var.c3_dns_postfix, var.c3_dns_prefix])))}"
}
resource "aws_instance" "rest" {
    count           = var.rest_servers
    ami             = var.rest_image_id
    instance_type   = var.rest_instance_type
    key_name        = var.rest_key_pair
    subnet_id       = var.rest_subnet_id
    vpc_security_group_ids = var.rest_security_groups_ids

    tags = merge(var.c3_tags, {"name"="${data.rest_name_prefix.rendered}-${count.index+1}", "Name"="${data.rest_name_prefix.rendered}-${count.index+1}"})
    volume_tags = merge(var.c3_tags, {"name"="${data.rest_name_prefix.rendered}-${count.index+1}", "Name"="${data.rest_name_prefix.rendered}-${count.index+1}"})
  
    root_block_device {
        volume_size = var.rest_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "rest" {
    count   = var.rest_servers
    zone_id = var.rest_dns_zone_id
    name    = "${rest_dns_prefix}${count.index+1}.${var.rest_dns_postfix}"
    type    = "CNAME"
    ttl     = var.rest_dns_ttl
    records = [element(aws_instance.rest.*.public_dns, count.index)]
}