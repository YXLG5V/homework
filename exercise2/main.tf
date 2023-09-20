module "s3_bucket" {
  source      = "./s3_bucket"
  bucket_name = "test-hw_backup_bucket"
  expiration  = 180
    providers = {
    aws = aws.bucket_account
  }
}

# Create uploader user with uploader account
resource "aws_iam_user" "uploader_user" {
  provider = aws.uploader_account
  name     = "uploader"
}

# Create IAM backup_uploader role
resource "aws_iam_role" "backup_uploader_role" {
  provider = aws.uploader_account
  name     = "backup_uploader"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = aws_iam_user.uploader_user.arn
        }
      }
    ]
  })
}

# Create IAM Policy for upload to bucket
resource "aws_iam_policy" "upload_policy" {
  provider    = aws.uploader_account
  name        = "s3_upload_policy"
  description = "Policy for S3 bucket upload"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Effect = "Allow",
        Resource = [
          module.s3_bucket.s3_bucket_arn,
          "${module.s3_bucket.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}

#  Assign IAM policy to the backup_uploader role
resource "aws_iam_policy_attachment" "upload_policy_attachment" {
  provider   = aws.uploader_account
  name       = "upload_policy_attachment"
  policy_arn = aws_iam_policy.upload_policy.arn
  roles      = [aws_iam_role.backup_uploader_role.name]
}

#Create bucket policy (allow upload for the backup_uploader role)
resource "aws_s3_bucket_policy" "backup_bucket_policy" {
  provider = aws.bucket_account
  bucket = module.s3_bucket.s3_bucket_id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = aws_iam_role.backup_uploader_role.arn
        },
        Action = [
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Resource = [
          module.s3_bucket.s3_bucket_arn,
          "${module.s3_bucket.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}