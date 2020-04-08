output "schema_registry_instances" {
    value = cp-aws-schema_registry.schema_registry_instances
}

output "schema_registry_dns_records" {
    value = cp-aws-schema_registry.schema_registry_dns_records
}

output "control_center_instances" {
    value = cp-aws-control_center.control_center_instances
}

output "control_center_dns_records" {
    value = cp-aws-control_center.control_center_dns_records
}

output "rest_proxy_instances" {
    value = cp-aws-rest_proxy.rest_proxy_instances
}

output "rest_proxy_dns_records" {
    value = cp-aws-rest_proxy.rest_proxy_dns_records
}

output "zookeeper_instances" {
    value = cp-aws-zookeeper.zookeeper_instances
}

output "zookeeper_dns_records" {
    value = cp-aws-zookeeper.zookeeper_dns_records
}

output "kafka_broker_instances" {
    value = cp-aws-kafka_broker.kafka_broker_instances
}

output "kafka_broker_dns_records" {
    value = cp-aws-kafka_broker.kafka_broker_dns_records
}

output "ksql_instances" {
    value = cp-aws-ksql.ksql_instances
}

output "ksql_dns_records" {
    value = cp-aws-ksql.ksql_dns_records
}

