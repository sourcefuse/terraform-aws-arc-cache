output "id" {
  value = module.elasticache-redis.id
  description = "ID of the ElastiCache Replication Group"
}

output "arn" {
  value = module.elasticache-redis.arn
  description = "ARN of the created ElastiCache Replication Group"
}

output "name" {
  value = module.elasticache-redis.name
  description = "The Name of the ElastiCache Subnet Group"
}

output "primary_endpoint_address" {
  value = module.elasticache-redis.primary_endpoint_address
  description = "Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled"
}