###########################
# Zookeeper Resources
###########################
resource "aws_instance" "zookeeper" {
    count           = var.zk_servers
    ami             = var.zk_image_id
    instance_type   = var.zk_instance_type
    key_name        = var.zk_key_pair
    subnet_id       = var.zk_subnet_id
    vpc_security_group_ids = var.zk_security_groups_ids
    

    tags = var.zk_tags
    volume_tags = var.zk_tags
  
    root_block_device {
        volume_size = var.zk_root_volume_size
        delete_on_termination = true
    }
}

resource "aws_route53_record" "zookeeper" {
    count   = var.zk_servers
    zone_id = var.zk_dns_zone_id
    name    = "${var.zk_dns_prefix}${count.index+1}${var.zk_dns_postfix}"
    type    = "CNAME"
    ttl     = var.zk_dns_ttl
    records = [element(aws_instance.zookeeper.*.public_dns, count.index)]
}