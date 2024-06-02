# [terraform-aws-arc-cache](https://github.com/sourcefuse/terraform-aws-arc-cache)

<a href="https://github.com/sourcefuse/terraform-aws-arc-cache/releases/latest"><img src="https://img.shields.io/github/release/sourcefuse/terraform-aws-arc-cache.svg?style=for-the-badge" alt="Latest Release"/></a> <a href="https://github.com/sourcefuse/terraform-aws-arc-cache/commits"><img src="https://img.shields.io/github/last-commit/sourcefuse/terraform-aws-arc-cache.svg?style=for-the-badge" alt="Last Updated"/></a> ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=sourcefuse_terraform-aws-arc-cache&token=bcaee4bc307204787c5256ab3fb7f3454a84c169)](https://sonarcloud.io/summary/new_code?id=sourcefuse_terraform-aws-arc-cache)

[![snyk](https://github.com/sourcefuse/terraform-aws-arc-cache/actions/workflows/snyk.yaml/badge.svg)](https://github.com/sourcefuse/terraform-aws-arc-cache/actions/workflows/snyk.yaml)

## Overview

SourceFuse AWS Reference Architecture (ARC) Terraform module for managing Elasticache replication clusters.

## Usage

To see a full example, check out the [main.tf](./example/main.tf) file in the example folder.  

```hcl
module "this" {
  source = "git::https://github.com/sourcefuse/terraform-aws-refarch-<module_name>"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0, < 6.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_replication_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.uuid_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_string.auth_token](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/string) | resource |
| [aws_security_groups.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_groups) | data source |
| [aws_ssm_parameter.retrieved_redis_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_subnets.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails | `bool` | n/a | yes |
| <a name="input_create_aws_elasticache_replication_group"></a> [create\_aws\_elasticache\_replication\_group](#input\_create\_aws\_elasticache\_replication\_group) | A boolean indicates whether to create aws elasticache replication group or not | `bool` | n/a | yes |
| <a name="input_create_aws_elasticache_subnet_group"></a> [create\_aws\_elasticache\_subnet\_group](#input\_create\_aws\_elasticache\_subnet\_group) | A boolean indicates whether to create aws elasticache subnet group or not | `bool` | n/a | yes |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | n/a | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the security groups | `string` | `"my-security-group"` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Egress rules for the security groups. | <pre>map(object({<br>    description       = optional(string)<br>    from_port         = number<br>    to_port           = number<br>    protocol          = string<br>    cidr_blocks       = optional(list(string))<br>    security_group_id = optional(list(string))<br>    ipv6_cidr_blocks  = optional(list(string))<br>  }))</pre> | `{}` | no |
| <a name="input_elasticache_subnet_group_name"></a> [elasticache\_subnet\_group\_name](#input\_elasticache\_subnet\_group\_name) | Name for the cache subnet group | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version number of the cache engine to be used for the cache clusters in this replication group | `string` | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Ingress rules for the security groups. | <pre>map(object({<br>    description       = optional(string)<br>    from_port         = number<br>    to_port           = number<br>    protocol          = string<br>    cidr_blocks       = optional(list(string))<br>    security_group_id = optional(list(string))<br>    ipv6_cidr_blocks  = optional(list(string))<br>    self              = optional(bool)<br>  }))</pre> | `{}` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Specifies whether to enable Multi-AZ Support for the replication group | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Prefix for the name of the security groups. | `string` | `"my-security-group"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Instance class to be used | `string` | n/a | yes |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | Number of cache clusters this replication group will have | `number` | n/a | yes |
| <a name="input_num_node_groups"></a> [num\_node\_groups](#input\_num\_node\_groups) | Number of node groups (shards) for this Redis replication group | `number` | n/a | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the parameter group to associate with this replication group | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port number on which each of the cache nodes will accept connection | `number` | n/a | yes |
| <a name="input_replicas_per_node_group"></a> [replicas\_per\_node\_group](#input\_replicas\_per\_node\_group) | Number of replica nodes in each node group. Changing this number will trigger a resizing operation before other settings modifications. Valid values are 0 to 5 | `number` | n/a | yes |
| <a name="input_replication_group_description"></a> [replication\_group\_description](#input\_replication\_group\_description) | User-created description for the replication group. Must not be empty | `string` | n/a | yes |
| <a name="input_replication_group_id"></a> [replication\_group\_id](#input\_replication\_group\_id) | Replication group identifier. This parameter is stored as a lowercase string | `string` | n/a | yes |
| <a name="input_security_group_names"></a> [security\_group\_names](#input\_security\_group\_names) | List of cache security group names to associate with this replication group | `list(string)` | n/a | yes |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them | `number` | n/a | yes |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | Daily time range during which ElastiCache will begin taking a daily snapshot of your cache cluster | `string` | n/a | yes |
| <a name="input_subnet_group_description"></a> [subnet\_group\_description](#input\_subnet\_group\_description) | Description for the cache subnet group | `string` | n/a | yes |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | Required when create\_aws\_elasticache\_subnet\_group is false. Name of the cache subnet group to be used for the replication group. | `string` | `null` | no |
| <a name="input_subnet_group_names"></a> [subnet\_group\_names](#input\_subnet\_group\_names) | Required when create\_aws\_elasticache\_subnet\_group is false. Name of the cache subnet group to be used for the replication group. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags to apply to every resource | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID Where resources will live | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output__replication_group_tags_all"></a> [\_replication\_group\_tags\_all](#output\_\_replication\_group\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the created ElastiCache Replication Group |
| <a name="output_cluster_enabled"></a> [cluster\_enabled](#output\_cluster\_enabled) | Indicates if cluster mode is enabled |
| <a name="output_configuration_endpoint_address"></a> [configuration\_endpoint\_address](#output\_configuration\_endpoint\_address) | Address of the replication group configuration endpoint when cluster mode is enabled |
| <a name="output_description"></a> [description](#output\_description) | The Description of the ElastiCache Subnet Group |
| <a name="output_engine_version_actual"></a> [engine\_version\_actual](#output\_engine\_version\_actual) | The Name of the ElastiCache Subnet Group |
| <a name="output_id"></a> [id](#output\_id) | ID of the ElastiCache Replication Group |
| <a name="output_member_clusters"></a> [member\_clusters](#output\_member\_clusters) | Identifiers of all the nodes that are part of this replication group |
| <a name="output_name"></a> [name](#output\_name) | The Name of the ElastiCache Subnet Group |
| <a name="output_primary_endpoint_address"></a> [primary\_endpoint\_address](#output\_primary\_endpoint\_address) | Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled |
| <a name="output_reader_endpoint_address"></a> [reader\_endpoint\_address](#output\_reader\_endpoint\_address) | Address of the endpoint for the reader node in the replication group, if the cluster mode is disabled |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
| <a name="output_subnet_group_tags_all"></a> [subnet\_group\_tags\_all](#output\_subnet\_group\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The Subnet IDs of the ElastiCache Subnet Group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning  
This project uses a `.version` file at the root of the repo which the pipeline reads from and does a git tag.  

When you intend to commit to `main`, you will need to increment this version. Once the project is merged,
the pipeline will kick off and tag the latest git commit.  

## Development

### Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [pre-commit](https://pre-commit.com/#install)
- [golang](https://golang.org/doc/install#install)
- [golint](https://github.com/golang/lint#installation)

### Configurations

- Configure pre-commit hooks
  ```sh
  pre-commit install
  ```

### Versioning

while Contributing or doing git commit please specify the breaking change in your commit message whether its major,minor or patch

For Example

```sh
git commit -m "your commit message #major"
```
By specifying this , it will bump the version and if you don't specify this in your commit message then by default it will consider patch and will bump that accordingly

### Tests
- Tests are available in `test` directory
- Configure the dependencies
  ```sh
  cd test/
  go mod init github.com/sourcefuse/terraform-aws-refarch-<module_name>
  go get github.com/gruntwork-io/terratest/modules/terraform
  ```
- Now execute the test  
  ```sh
  go test -timeout  30m
  ```

## Authors

This project is authored by:
- SourceFuse ARC Team
