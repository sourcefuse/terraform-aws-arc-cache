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
| <a name="module_elasticache-redis"></a> [elasticache-redis](#module\_elasticache-redis) | sourcefuse/arc-cache/aws | 0.0.1 |
| <a name="module_tags"></a> [tags](#module\_tags) | sourcefuse/arc-tags/aws | 1.2.3 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_logs_log_group_name"></a> [cloudwatch\_logs\_log\_group\_name](#input\_cloudwatch\_logs\_log\_group\_name) | name of the log group | `string` | `"/logs/elasticcache-redis"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `"poc"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of elasticache redis | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the resources. | `string` | `"arc"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Number of days you want to retain log events in the log group | `number` | `"30"` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | Ingress and egress rules for the security groups. | <pre>object({<br>    ingress = map(object({<br>      description       = optional(string)<br>      from_port         = number<br>      to_port           = number<br>      protocol          = string<br>      cidr_blocks       = optional(list(string))<br>      security_group_id = optional(list(string))<br>      ipv6_cidr_blocks  = optional(list(string))<br>      self              = optional(bool)<br>    }))<br>    egress = map(object({<br>      description       = optional(string)<br>      from_port         = number<br>      to_port           = number<br>      protocol          = string<br>      cidr_blocks       = optional(list(string))<br>      security_group_id = optional(list(string))<br>      ipv6_cidr_blocks  = optional(list(string))<br>    }))<br>  })</pre> | <pre>{<br>  "egress": {},<br>  "ingress": {}<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the created ElastiCache Replication Group |
| <a name="output_id"></a> [id](#output\_id) | ID of the ElastiCache Replication Group |
| <a name="output_name"></a> [name](#output\_name) | The Name of the ElastiCache Subnet Group |
| <a name="output_primary_endpoint_address"></a> [primary\_endpoint\_address](#output\_primary\_endpoint\_address) | Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
