output "control_center_instances" {
    value = aws_intance.c3
}

output "control_center_dns_records" {
    value = aws_route53_record.c3
}