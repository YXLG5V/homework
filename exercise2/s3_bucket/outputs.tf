output "s3_bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.backup_bucket.id
}

output "s3_bucket_arn" {
  description = "S3 bucket arn"
  value       = aws_s3_bucket.backup_bucket.arn
}