output "schema_registry_instances" {
    value = aws_intance.sr
}

output "schema_registry_dns_records" {
    value = aws_route53_record.sr
}