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
    MonoRepoPath = "terraform/elasticache"
  }
}
resource "aws_cloudwatch_log_group" "default" {
  name              = var.cloudwatch_logs_log_group_name
  retention_in_days = var.retention_in_days
  tags              = module.tags.tags
}

module "elasticache-redis" {
  source               = "../"
  subnet_ids           = data.aws_subnets.private.ids
  vpc_id               = data.aws_vpc.vpc.id
  tags                 = module.tags.tags
  security_group_rules = var.security_group_rules
  name                 = var.name

  log_delivery_configuration = [
    {
      destination      = aws_cloudwatch_log_group.default.name
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "engine-log"
    }
  ]

}
