# Create Terraform files to set up the necessary AWS resources.
provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "your-s3-bucket-name"
}

resource "aws_rds_instance" "db" {
  identifier               = "your-rds-instance"
  allocated_storage        = 20
  engine                   = "mysql"
  engine_version           = "5.7"
  instance_class           = "db.t2.micro"
  name                     = "your-rds-db-name"
  username                 = "your-rds-username"
  password                 = "your-rds-password"
  skip_final_snapshot      = true
  publicly_accessible      = true
}

resource "aws_ecr_repository" "repo" {
  name = "your-ecr-repo-name"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_lambda_function" "lambda" {
  function_name = "s3-to-rds-or-glue"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main.handler"
  runtime       = "python3.9"

  image_uri = "${aws_ecr_repository.repo.repository_url}:latest"
  package_type = "Image"

  environment {
    variables = {
      S3_BUCKET = "your-s3-bucket-name"
      RDS_ENDPOINT = "your-rds-endpoint"
      RDS_USER = "your-rds-username"
      RDS_PASSWORD = "your-rds-password"
      RDS_DB_NAME = "your-rds-db-name"
    }
  }
}
