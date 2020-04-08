output "zookeeper_instances" {
    value = aws_intance.zookeeper
}

output "zookeeper_dns_records" {
    value = aws_route53_record.zookeeper
}