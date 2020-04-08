###########################
# KSQL Resources
###########################
resource "aws_instance" "ksql" {
    count           = var.ksql_servers
    ami             = var.ksql_image_id
    instance_type   = var.ksql_instance_type
    key_name        = var.ksql_key_pair
    subnet_id       = var.ksql_subnet_id
    vpc_security_group_ids = var.ksql_security_groups_ids
    

    tags = var.ksql_tags
    volume_tags = var.ksql_tags
  
    root_block_device {
        volume_size = var.ksql_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "ksql" {
    count   = var.ksql_servers
    zone_id = var.ksql_dns_zone_id
    name    = "${ksql_dns_prefix}${count.index+1}${var.ksql_dns_postfix}"
    type    = "CNAME"
    ttl     = var.ksql_dns_ttl
    records = [element(aws_instance.ksql.*.public_dns, count.index)]
}