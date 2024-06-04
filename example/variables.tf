################################################################################
## shared
################################################################################
variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "environment" {
  type        = string
  default     = "poc"
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
  default     = "arc"
}
variable "ingress_rules" {
  type = map(object({
    description       = optional(string)
    from_port         = number
    to_port           = number
    protocol          = string
    cidr_blocks       = optional(list(string))
    security_group_id = optional(list(string))
    ipv6_cidr_blocks  = optional(list(string))
    self              = optional(bool)
  }))
  description = "Ingress rules for the security groups."
  default     = {}
}

variable "egress_rules" {
  type = map(object({
    description       = optional(string)
    from_port         = number
    to_port           = number
    protocol          = string
    cidr_blocks       = optional(list(string))
    security_group_id = optional(list(string))
    ipv6_cidr_blocks  = optional(list(string))
  }))
  description = "Egress rules for the security groups."
  default     = {}
}

variable "elasticacheredis" {
  type = map(object({
    create_cache                  = optional(bool, true)
    automatic_failover_enabled    = optional(bool, true)
    multi_az_enabled              = optional(bool, false)
    replication_group_id          = string
    node_type                     = string
    num_cache_clusters            = number
    parameter_group_name          = string
    port                          = number
    replication_group_description = optional(string)
    create_cache_subnet_group     = optional(bool, true)
    elasticache_subnet_group_name = string
    subnet_group_description      = optional(string)
    engine_version                = string
    snapshot_retention_limit      = number
    snapshot_window               = string
    num_node_groups               = number
    replicas_per_node_group       = number
  }))
  description = "ElastiCache Redis instance configuration"
  default     = {}
}

variable "retention_in_days" {
  description = "Number of days you want to retain log events in the log group"
  type        = number
  default     = "30"
}

variable "cloudwatch_logs_log_group_name" {
  default     = "/logs/elasticcache-redis"
  type        = string
  description = "name of the log group"
}
