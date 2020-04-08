output "kafka_connect_instances" {
    value = aws_intance.kafka_connect
}

output "kafka_connect_dns_records" {
    value = aws_route53_record.kafka_connect
}