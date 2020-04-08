output "ksql_instances" {
    value = aws_intance.ksql
}

output "ksql_dns_records" {
    value = aws_route53_record.ksql
}