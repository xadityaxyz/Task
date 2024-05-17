# for variables 
variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  default     = "your-s3-bucket-name"
}

variable "rds_instance_class" {
  description = "The instance class for RDS"
  default     = "db.t2.micro"
}

variable "rds_db_name" {
  description = "The database name for RDS"
  default     = "your-rds-db-name"
}

variable "rds_username" {
  description = "The username for RDS"
  default     = "your-rds-username"
}

variable "rds_password" {
  description = "The password for RDS"
  default     = "your-rds-password"
}
