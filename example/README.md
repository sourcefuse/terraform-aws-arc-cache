# terraform-aws-module-template example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0, < 6.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_elasticacheredis"></a> [elasticacheredis](#module\_elasticacheredis) | ../ | n/a |
| <a name="module_tags"></a> [tags](#module\_tags) | sourcefuse/arc-tags/aws | 1.2.3 |

## Resources

| Name | Type |
|------|------|
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Egress rules for the security groups. | <pre>map(object({<br>    description       = optional(string)<br>    from_port         = number<br>    to_port           = number<br>    protocol          = string<br>    cidr_blocks       = optional(list(string))<br>    security_group_id = optional(list(string))<br>    ipv6_cidr_blocks  = optional(list(string))<br>  }))</pre> | `{}` | no |
| <a name="input_elasticacheredis"></a> [elasticacheredis](#input\_elasticacheredis) | ElastiCache Redis instance configuration | <pre>map(object({<br>    create_aws_elasticache_replication_group = optional(bool, true)<br>    automatic_failover_enabled               = optional(bool, true)<br>    multi_az_enabled                         = optional(bool, false)<br>    replication_group_id                     = string<br>    node_type                                = string<br>    num_cache_clusters                       = number<br>    parameter_group_name                     = string<br>    port                                     = number<br>    replication_group_description            = optional(string)<br>    create_aws_elasticache_subnet_group      = optional(bool, true)<br>    elasticache_subnet_group_name            = string<br>    subnet_group_description                 = optional(string)<br>    engine_version                           = string<br>    security_group_names                     = list(string)<br>    subnet_group_names                       = list(string)<br>    snapshot_retention_limit                 = number<br>    snapshot_window                          = string<br>    num_node_groups                          = number<br>    replicas_per_node_group                  = number<br>  }))</pre> | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `"poc"` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Ingress rules for the security groups. | <pre>map(object({<br>    description       = optional(string)<br>    from_port         = number<br>    to_port           = number<br>    protocol          = string<br>    cidr_blocks       = optional(list(string))<br>    security_group_id = optional(list(string))<br>    ipv6_cidr_blocks  = optional(list(string))<br>    self              = optional(bool)<br>  }))</pre> | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the resources. | `string` | `"arc"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
