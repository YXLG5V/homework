#Create bucket
resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "my_bucket"
  }
}

#Encryption enabled
# resource "aws_kms_key" "hw_bucket_key" {
#   description             = "key to encrypt hw_bucket objects"
#   deletion_window_in_days = 7
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "hw_bucket_encryption" {
#   bucket = aws_s3_bucket.backup_bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.hw_bucket_key.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }

#Encryption enabled
resource "aws_s3_bucket_server_side_encryption_configuration" "hw_bucket_encryption" {
  bucket = aws_s3_bucket.backup_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#Lifecycle rules config
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_rule" {
  bucket = aws_s3_bucket.backup_bucket.id

  rule {
    id = "expire_old_backups"

    transition {
      storage_class = "INTELLIGENT_TIERING"
    }

    expiration {
      days = var.expiration
    }

    status = "Enabled"
  }
}

#Set acl --> private (Write/read only the owner)
resource "aws_s3_bucket_acl" "backup_bucket" {
  bucket = aws_s3_bucket.backup_bucket.id
  acl    = "private"
}

#Block public access
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.backup_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.backup_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}