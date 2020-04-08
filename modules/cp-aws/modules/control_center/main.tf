###########################
# C3 Resources
###########################
resource "aws_instance" "c3" {
    count           = var.c3_servers
    ami             = var.c3_image_id
    instance_type   = var.c3_instance_type
    key_name        = var.c3_key_pair
    subnet_id       = var.c3_subnet_id
    vpc_security_group_ids = var.c3_security_groups_ids
    

    tags = var.c3_tags
    
    volume_tags = var.c3_tags
  
    root_block_device {
        volume_size = var.c3_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "c3" {
    count   = var.c3_servers
    zone_id = var.c3_dns_zone_id
    name    = "${var.c3_dns_prefix}${count.index+1}${var.c3_dns_postfix}"
    type    = "CNAME"
    ttl     = var.c3_dns_ttl
    records = [element(aws_instance.c3.*.public_dns, count.index)]
}