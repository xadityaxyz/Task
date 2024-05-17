output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "rds_endpoint" {
  value = aws_rds_instance.db.endpoint
}

output "ecr_repository_url" {
  value = aws_ecr_repository.repo.repository_url
}
