resource "random_string" "auth_token" {
  length  = 32 # You can adjust the length as needed within the specified range
  special = false
  upper   = true
  lower   = true
  numeric = true
}

resource "aws_ssm_parameter" "uuid_parameter" {
  name  = "/app/supporter/redis/password"
  type  = "SecureString"
  value = random_string.auth_token.result
}
resource "aws_elasticache_replication_group" "this" {
  count                      = var.create_aws_elasticache_replication_group == true ? 1 : 0
  automatic_failover_enabled = var.automatic_failover_enabled
  replication_group_id       = var.replication_group_id
  description                = var.replication_group_description
  node_type                  = var.node_type
  num_cache_clusters         = var.num_cache_clusters
  parameter_group_name       = var.parameter_group_name
  security_group_ids         = data.aws_security_groups.this.ids
  port                       = var.port
  multi_az_enabled           = var.multi_az_enabled
  engine_version             = var.engine_version
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  num_node_groups            = var.num_node_groups
  replicas_per_node_group    = var.replicas_per_node_group
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  subnet_group_name          = var.create_aws_elasticache_subnet_group == true ? aws_elasticache_subnet_group.this[0].name : var.subnet_group_name
  transit_encryption_enabled = true
  auth_token                 = data.aws_ssm_parameter.retrieved_redis_password.value
  tags                       = var.tags
  depends_on                 = [aws_security_group.sg]
}

resource "aws_elasticache_subnet_group" "this" {
  count       = var.create_aws_elasticache_subnet_group == true ? 1 : 0
  name        = var.elasticache_subnet_group_name
  description = var.subnet_group_description
  subnet_ids  = data.aws_subnets.this.ids
  tags        = var.tags
  depends_on  = [aws_security_group.sg]
}

resource "aws_security_group" "sg" {
  count = var.create_security_group ? 1 : 0

  name        = var.name
  vpc_id      = var.vpc_id
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress_rules

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
    for_each = var.egress_rules

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

  lifecycle {
    create_before_destroy = true
  }
}
