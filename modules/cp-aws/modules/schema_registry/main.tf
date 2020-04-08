###########################
# SchemaReg Resources
###########################
resource "aws_instance" "sr" {
    count           = var.sr_servers
    ami             = var.sr_image_id
    instance_type   = var.sr_instance_type
    key_name        = var.sr_key_pair
    subnet_id       = var.sr_subnet_id
    vpc_security_group_ids = var.sr_security_groups_ids
    

    tags = vars.sr_tags
    volume_tags = vars.sr_tags
  
    root_block_device {
        volume_size = var.sr_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "sr" {
    count   = var.sr_servers
    zone_id = var.sr_dns_zone_id
    name    = "${var.sr_dns_prefix}${count.index+1}${var.sr_dns_postfix}"
    type    = "CNAME"
    ttl     = var.sr_dns_ttl
    records = [element(aws_instance.sr.*.public_dns, count.index)]
}