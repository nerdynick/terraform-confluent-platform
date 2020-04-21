output "instances" {
    value = aws_intance.instance
}

output "dns_records" {
    value = aws_route53_record.dns_record
}