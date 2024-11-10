## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.69.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_image_builder_infra_config"></a> [ec2\_image\_builder\_infra\_config](#module\_ec2\_image\_builder\_infra\_config) | ../../modules/ec2_image_builder/infra_config | n/a |
| <a name="module_ec2_image_builder_pipeline"></a> [ec2\_image\_builder\_pipeline](#module\_ec2\_image\_builder\_pipeline) | ../../modules/ec2_image_builder/pipeline | n/a |
| <a name="module_ec2_image_builder_recipe"></a> [ec2\_image\_builder\_recipe](#module\_ec2\_image\_builder\_recipe) | ../../modules/ec2_image_builder/recipe | n/a |
| <a name="module_iam_instance_profile"></a> [iam\_instance\_profile](#module\_iam\_instance\_profile) | ../../modules/iam/instance_profile | n/a |
| <a name="module_iam_key_pair"></a> [iam\_key\_pair](#module\_iam\_key\_pair) | ../../modules/iam/key_pair | n/a |
| <a name="module_s3_bucket_logs"></a> [s3\_bucket\_logs](#module\_s3\_bucket\_logs) | ../../modules/s3/bucket | n/a |
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | ../../modules/sns/topic | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_security_group.name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
