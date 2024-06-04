resource "random_string" "auth_token" {
  length  = 32 # You can adjust the length as needed within the specified range
  special = false
  upper   = true
  lower   = true
  numeric = true
}

resource "aws_ssm_parameter" "uuid_parameter" {
  name  = "/${var.namespace}/${var.environment}/redis/password"
  type  = "SecureString"
  value = random_string.auth_token.result
}
resource "aws_elasticache_replication_group" "this" {
  automatic_failover_enabled = var.automatic_failover_enabled
  replication_group_id       = coalesce(var.replication_group_id, "${var.namespace}-${var.environment}-elasticache")
  description                = coalesce(var.replication_group_description, "Default Redis replication group description.")
  node_type                  = var.node_type
  num_cache_clusters         = var.num_cache_clusters
  parameter_group_name       = coalesce(var.parameter_group_name, "${var.namespace}-${var.environment}-elasticache")
  security_group_ids         = var.create_security_group == true ? aws_security_group.sg[*].id : var.security_group_ids
  port                       = var.port
  multi_az_enabled           = var.multi_az_enabled
  engine_version             = var.engine_version
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  num_node_groups            = var.num_node_groups
  replicas_per_node_group    = var.replicas_per_node_group
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  subnet_group_name          = var.create_cache_subnet_group == true ? aws_elasticache_subnet_group.this[0].name : var.subnet_group_name
  transit_encryption_enabled = true
  auth_token                 = data.aws_ssm_parameter.retrieved_redis_password.value
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  apply_immediately          = var.apply_immediately
  user_group_ids             = var.user_group_ids
  tags                       = var.tags
  dynamic "log_delivery_configuration" {
    for_each = var.log_delivery_configuration

    content {
      destination      = lookup(log_delivery_configuration.value, "destination", null)
      destination_type = lookup(log_delivery_configuration.value, "destination_type", null)
      log_format       = lookup(log_delivery_configuration.value, "log_format", null)
      log_type         = lookup(log_delivery_configuration.value, "log_type", null)
    }
  }
  lifecycle {
    ignore_changes = [
      security_group_names,
    ]
  }
  depends_on = [
    aws_elasticache_parameter_group.this
  ]
}
resource "aws_elasticache_parameter_group" "this" {
  count       = var.create_parameter_group ? 1 : 0
  name        = local.parameter_group_name
  description = var.parameter_group_description != null ? var.parameter_group_description : "Elasticache parameter group ${local.parameter_group_name}"
  family      = var.family

  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = tostring(parameter.value.value)
    }
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true

    # Ignore changes to the description since it will try to recreate the resource
    ignore_changes = [
      description,
    ]
  }
}

resource "aws_elasticache_subnet_group" "this" {
  count       = var.create_cache_subnet_group == true ? 1 : 0
  name        = coalesce(var.elasticache_subnet_group_name, "${var.namespace}-${var.environment}-redis-subnet-group")
  description = coalesce(var.subnet_group_description, "Default description for the Redis subnet group.")
  subnet_ids  = var.subnet_ids
  tags        = var.tags
}

resource "aws_security_group" "sg" {
  count = var.create_security_group ? 1 : 0

  name        = coalesce(var.security_group_name, "cache-security-group")
  vpc_id      = var.vpc_id
  description = coalesce(var.security_group_description, "Default description of cache-security-group")

  dynamic "ingress" {
    for_each = var.security_group_rules.ingress

    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      security_groups  = ingress.value.security_group_id != null ? ingress.value.security_group_id : []
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      self             = ingress.value.self
    }
  }

  dynamic "egress" {
    for_each = var.security_group_rules.egress

    content {
      description      = egress.value.description
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      security_groups  = egress.value.security_group_id != null ? egress.value.security_group_id : []
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
    }
  }

  tags = var.tags

}
