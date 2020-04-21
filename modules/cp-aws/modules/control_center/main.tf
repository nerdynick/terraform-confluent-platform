###########################
# C3 Resources
###########################
data "template_file" "c3_names" {
    count           = var.c3_servers
    template        = var.c3_name_template
    vars = {
        "count" = "${count.index+1}"
    }
}
data "template_file" "c3_dns" {
    count           = var.c3_servers
    template        = var.c3_dns_template
    vars = {
        "count" = "${count.index+1}"
        "name" = data.template_file.
    }
}
resource "aws_instance" "c3" {
    count           = var.c3_servers
    ami             = var.c3_image_id
    instance_type   = var.c3_instance_type
    key_name        = var.c3_key_pair
    subnet_id       = var.c3_subnet_id
    vpc_security_group_ids = var.c3_security_groups_ids
    

    tags = merge(var.c3_tags, {"name"="${data.c3_name_prefix.rendered}-${count.index+1}", "Name"="${data.c3_name_prefix.rendered}-${count.index+1}"})
    volume_tags = merge(var.c3_tags, {"name"="${data.c3_name_prefix.rendered}-${count.index+1}", "Name"="${data.c3_name_prefix.rendered}-${count.index+1}"})

    root_block_device {
        volume_size = var.c3_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "c3" {
    count   = var.c3_servers
    zone_id = var.c3_dns_zone_id
    name    = "${var.c3_dns_prefix}${count.index+1}.${var.c3_dns_postfix}"
    type    = "CNAME"
    ttl     = var.c3_dns_ttl
    records = [element(aws_instance.c3.*.public_dns, count.index)]
}