output "kafka_broker_instances" {
    value = aws_intance.kafka_broker
}

output "kafka_broker_dns_records" {
    value = aws_route53_record.kafka_broker
}