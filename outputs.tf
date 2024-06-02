output "arn" {
  value       = aws_elasticache_replication_group.this[*].arn
  description = "ARN of the created ElastiCache Replication Group"
}

output "engine_version_actual" {
  value       = aws_elasticache_replication_group.this[*].engine_version_actual
  description = "The Name of the ElastiCache Subnet Group"
}

output "cluster_enabled" {
  value       = aws_elasticache_replication_group.this[*].cluster_enabled
  description = "Indicates if cluster mode is enabled"
}

output "configuration_endpoint_address" {
  value       = aws_elasticache_replication_group.this[*].configuration_endpoint_address
  description = "Address of the replication group configuration endpoint when cluster mode is enabled"
}

output "id" {
  value       = aws_elasticache_replication_group.this[*].id
  description = "ID of the ElastiCache Replication Group"
}

output "member_clusters" {
  value       = aws_elasticache_replication_group.this[*].member_clusters
  description = "Identifiers of all the nodes that are part of this replication group"
}

output "primary_endpoint_address" {
  value       = aws_elasticache_replication_group.this[*].primary_endpoint_address
  description = "Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled"
}

output "reader_endpoint_address" {
  value       = aws_elasticache_replication_group.this[*].reader_endpoint_address
  description = "Address of the endpoint for the reader node in the replication group, if the cluster mode is disabled"
}

output "_replication_group_tags_all" {
  value       = aws_elasticache_replication_group.this[*].tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider"
}

output "description" {
  value       = aws_elasticache_subnet_group.this[*].description
  description = "The Description of the ElastiCache Subnet Group"
}

output "name" {
  value       = aws_elasticache_subnet_group.this[*].name
  description = "The Name of the ElastiCache Subnet Group"
}

output "subnet_ids" {
  value       = aws_elasticache_subnet_group.this[*].subnet_ids
  description = "The Subnet IDs of the ElastiCache Subnet Group"
}

output "subnet_group_tags_all" {
  value       = aws_elasticache_subnet_group.this[*].tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider"
}
output "security_group_id" {
  value       = aws_security_group.sg[*].id
  description = "The ID of the security group"
}
