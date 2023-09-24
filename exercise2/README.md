## Implemented solution

1. Create a bucket  
2. Set expiration 180 days  
    with lifecycle rule  
3. Best practices  
    Set Versioning  
4. Security  
    Set Encryption  
    Set ACL to private  
    Block public access  
5. Cost reduction  
    No KMS key used for encryption  
    Set Infrequent Access after 7 days  
6. Use different account  
    Create uploader user with uploader account  
    Create IAM backup_uploader role  
    Create IAM Policy for upload to bucket  
    Assign IAM policy to the backup_uploader role  
7. Set up backup_uploader role  
    Create bucket policy (allow upload for the backup_uploader role)  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.bucket_account"></a> [aws.bucket\_account](#provider\_aws.bucket\_account) | 5.17.0 |
| <a name="provider_aws.uploader_account"></a> [aws.uploader\_account](#provider\_aws.uploader\_account) | 5.17.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | ./s3_bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.upload_policy](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.upload_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.backup_uploader_role](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/iam_role) | resource |
| [aws_iam_user.uploader_user](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/iam_user) | resource |
| [aws_s3_bucket_policy.backup_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket_policy) | resource |

## Inputs

No inputs.

## Outputs

No outputs.