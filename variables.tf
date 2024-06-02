variable "create_aws_elasticache_replication_group" {
  type        = bool
  description = "A boolean indicates whether to create aws elasticache replication group or not"
}

variable "automatic_failover_enabled" {
  type        = bool
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails"
}

variable "replication_group_id" {
  type        = string
  description = "Replication group identifier. This parameter is stored as a lowercase string"
}

variable "replication_group_description" {
  type        = string
  description = "User-created description for the replication group. Must not be empty"
}

variable "node_type" {
  type        = string
  description = "Instance class to be used"
}

variable "num_cache_clusters" {
  type        = number
  description = "Number of cache clusters this replication group will have"
}

variable "parameter_group_name" {
  type        = string
  description = "Name of the parameter group to associate with this replication group"
}

variable "port" {
  type        = number
  description = "Port number on which each of the cache nodes will accept connection"
}

variable "multi_az_enabled" {
  type        = bool
  description = "Specifies whether to enable Multi-AZ Support for the replication group"
}

variable "engine_version" {
  type        = string
  description = "Version number of the cache engine to be used for the cache clusters in this replication group"
}

variable "create_aws_elasticache_subnet_group" {
  type        = bool
  description = "A boolean indicates whether to create aws elasticache subnet group or not"
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Name for the cache subnet group"
}

variable "subnet_group_names" {
  type        = list(string)
  description = "Required when create_aws_elasticache_subnet_group is false. Name of the cache subnet group to be used for the replication group."
}

variable "snapshot_retention_limit" {
  type        = number
  description = "Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them"
}

variable "snapshot_window" {
  type        = string
  description = "Daily time range during which ElastiCache will begin taking a daily snapshot of your cache cluster"
}

variable "tags" {
  type        = map(string)
  description = "Default tags to apply to every resource"
}

variable "subnet_group_description" {
  type        = string
  description = "Description for the cache subnet group"
}

variable "subnet_group_name" {
  type        = string
  description = "Required when create_aws_elasticache_subnet_group is false. Name of the cache subnet group to be used for the replication group."
  default     = null
}


variable "vpc_id" {
  description = "VPC ID Where resources will live"
  type        = string
}

variable "num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for this Redis replication group"
}

variable "security_group_names" {
  type        = list(string)
  description = "List of cache security group names to associate with this replication group"
}

variable "replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Changing this number will trigger a resizing operation before other settings modifications. Valid values are 0 to 5"
}

variable "description" {
  type        = string
  description = "Description of the security groups"
  default     = "my-security-group"
}

variable "name" {
  type        = string
  description = "Prefix for the name of the security groups."
  default     = "my-security-group"
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

variable "create_security_group" {
  type    = bool
  default = false
}
