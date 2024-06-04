variable "environment" {
  type        = string
  default     = "dev"
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
  default     = "arc"
}

variable "automatic_failover_enabled" {
  type        = bool
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails"
  default     = false
}

variable "name" {
  type        = string
  description = "Name of elasticache redis"
}

variable "replication_group_description" {
  type        = string
  description = "User-created description for the replication group. Must not be empty"
  default     = null
}

variable "node_type" {
  type        = string
  description = "Instance class to be used"
  default     = "cache.t2.micro"
}

variable "num_cache_clusters" {
  type        = number
  description = "Number of cache clusters this replication group will have"
  default     = 1
}

variable "port" {
  type        = number
  description = "Port number on which each of the cache nodes will accept connection"
  default     = 6379
}

variable "multi_az_enabled" {
  type        = bool
  description = "Specifies whether to enable Multi-AZ Support for the replication group"
  default     = false
}

variable "engine_version" {
  type        = string
  description = "Version number of the cache engine to be used for the cache clusters in this replication group"
  default     = "7.0"
}

variable "create_cache_subnet_group" {
  type        = bool
  description = "A boolean indicates whether to create aws elasticache subnet group or not"
  default     = true
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Name for the cache subnet group"
  default     = null
}

variable "snapshot_retention_limit" {
  type        = number
  description = "Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them"
  default     = 1
}

variable "snapshot_window" {
  type        = string
  default     = "01:30-02:30"
  description = "Daily time range during which ElastiCache will begin taking a daily snapshot of your cache cluster"
}

variable "tags" {
  type        = map(string)
  description = "Tags for AWS elasticache redis"
}

variable "subnet_group_description" {
  type        = string
  description = "Description for the cache subnet group"
  default     = null
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
variable "subnet_ids" {
  description = "private subnet ids"
  type        = list(string)
}

variable "num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for this Redis replication group"
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of cache security group names to associate with this replication group"
  default     = [""]
}

variable "replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Changing this number will trigger a resizing operation before other settings modifications. Valid values are 0 to 5"
  default     = null
}

variable "security_group_description" {
  type        = string
  description = "Description of the security groups"
  default     = null
}

variable "security_group_name" {
  type        = string
  description = "Prefix for the name of the security groups."
  default     = null
}

variable "security_group_rules" {
  type = object({
    ingress = map(object({
      description       = optional(string)
      from_port         = number
      to_port           = number
      protocol          = string
      cidr_blocks       = optional(list(string))
      security_group_id = optional(list(string))
      ipv6_cidr_blocks  = optional(list(string))
      self              = optional(bool)
    }))
    egress = map(object({
      description       = optional(string)
      from_port         = number
      to_port           = number
      protocol          = string
      cidr_blocks       = optional(list(string))
      security_group_id = optional(list(string))
      ipv6_cidr_blocks  = optional(list(string))
    }))
  })
  description = "Ingress and egress rules for the security groups."
  default = {
    ingress = {},
    egress  = {}
  }
}

variable "create_security_group" {
  type        = bool
  description = "Determines whether to create a new security group."
  default     = true
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "Specifies whether at-rest encryption is enabled."
  default     = true
}

variable "apply_immediately" {
  type        = bool
  default     = true
  description = "Apply changes immediately"
}
variable "create_parameter_group" {
  type        = bool
  default     = true
  description = "Whether new parameter group should be created. Set to false if you want to use existing parameter group"
}

variable "parameter_group_description" {
  type        = string
  default     = null
  description = "elasticache paramter group"
}

variable "parameter_group_name" {
  type        = string
  default     = null
  description = "Override the default parameter group name"
}

variable "log_delivery_configuration" {
  type        = list(map(any))
  default     = []
  description = "The log_delivery_configuration block allows the streaming of Redis SLOWLOG or Redis Engine Log to CloudWatch Logs or Kinesis Data Firehose. Max of 2 blocks."
}
variable "auto_minor_version_upgrade" {
  type        = bool
  default     = null
  description = "Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported if the engine version is 6 or higher."
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. Only 1 `cluster_mode` block is allowed"
  default     = false
}
variable "family" {
  type        = string
  default     = "redis7"
  description = "Redis family"
}
variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
}
variable "user_group_ids" {
  type        = list(string)
  default     = null
  description = "User Group ID to associate with the replication group"
}
