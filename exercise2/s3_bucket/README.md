## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.backup_bucket](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.backup_bucket](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.lifecycle_rule](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_public_access_block.public_block](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.hw_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_expiration"></a> [expiration](#input\_expiration) | n/a | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | S3 bucket arn |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | ID of the S3 bucket |