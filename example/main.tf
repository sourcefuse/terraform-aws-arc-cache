################################################################################
## defaults
################################################################################
terraform {
  required_version = "~> 1.3, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0, < 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  region = var.region
}

module "tags" {
  source  = "sourcefuse/arc-tags/aws"
  version = "1.2.3"

  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/synthetics"
  }
}
module "elasticacheredis" {
  source   = "../"
  for_each = var.elasticacheredis

  elasticache_subnet_group_name = each.value.elasticache_subnet_group_name

  ## networking
  subnet_group_names                  = [data.aws_subnets.private.ids]
  subnet_group_description            = each.value.subnet_group_description
  multi_az_enabled                    = each.value.multi_az_enabled
  create_aws_elasticache_subnet_group = each.value.create_aws_elasticache_subnet_group
  vpc_id                              = data.aws_vpc.vpc.id
  security_group_names                = each.value.security_group_names

  ## configuration
  create_aws_elasticache_replication_group = each.value.create_aws_elasticache_replication_group
  automatic_failover_enabled               = each.value.automatic_failover_enabled
  replication_group_id                     = each.value.replication_group_id
  replication_group_description            = each.value.replication_group_description
  node_type                                = each.value.node_type
  num_cache_clusters                       = each.value.num_cache_clusters
  parameter_group_name                     = each.value.parameter_group_name
  engine_version                           = each.value.engine_version
  snapshot_retention_limit                 = each.value.snapshot_retention_limit
  snapshot_window                          = each.value.snapshot_window
  port                                     = each.value.port
  num_node_groups                          = each.value.num_node_groups
  replicas_per_node_group                  = each.value.replicas_per_node_group
  tags                                     = module.tags.tags
  create_security_group                    = true
  name                                     = "example-sg"
  description                              = "Example security group"
  ingress_rules                            = var.ingress_rules
  egress_rules                             = var.egress_rules

}
