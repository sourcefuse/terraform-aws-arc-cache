namespace    = "arc"
region       = "us-east-1"
environment  = "poc"
project_name = "arc-mono-infra"

elasticacheredis = {
  dev_is_custom_feed_cluster_replication_group = {
    create_aws_elasticache_replication_group = true
    automatic_failover_enabled               = false
    multi_az_enabled                         = false
    replication_group_id                     = "arc-mayank-elasticache"
    replication_group_description            = "arc-elasticache-Server"
    node_type                                = "cache.t2.micro"
    num_cache_clusters                       = 1
    engine_version                           = "7.0"
    parameter_group_name                     = "arc-elasticcache"
    port                                     = 6379
    snapshot_retention_limit                 = 1
    snapshot_window                          = "01:30-02:30"
    create_aws_elasticache_subnet_group      = true
    elasticache_subnet_group_name            = "arc-elasticache-subnet-group"
    subnet_group_description                 = "elasticache-subnet-group"
    num_node_groups                          = null
    replicas_per_node_group                  = null
  }
}
ingress_rules = {
  rule1 = {
    description = "incoming traffic from default-vpc"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["10.12.0.0/16"] // change it according to your requirement
  }
}
egress_rules = {
  "rule1" = {
    description = "outgoing traffic to anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
