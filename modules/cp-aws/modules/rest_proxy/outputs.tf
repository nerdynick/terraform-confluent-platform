output "rest_proxy_instances" {
    value = aws_intance.rest
}

output "rest_proxy_dns_records" {
    value = aws_route53_record.rest
}