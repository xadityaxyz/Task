# Set up a Jenkinsfile for CI/CD.

  pipeline {
    agent any

    environment {
        AWS_REGION = 'us-west-2'
        S3_BUCKET = 'your-s3-bucket-name'
        RDS_ENDPOINT = 'your-rds-endpoint'
        RDS_USER = 'your-rds-username'
        RDS_PASSWORD = 'your-rds-password'
        RDS_DB_NAME = 'your-rds-db-name'
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -chdir=terraform'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve -chdir=terraform'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t your-ecr-repo-name:latest .'
                }
            }
        }

        stage('Login to AWS ECR') {
            steps {
                script {
                    sh '$(aws ecr get-login --no-include-email --region us-west-2)'
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    sh 'docker tag your-ecr-repo-name:latest ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/your-ecr-repo-name:latest'
                    sh 'docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/your-ecr-repo-name:latest'
                }
            }
        }

        stage('Deploy Lambda Function') {
            steps {
                script {
                    sh 'terraform apply -auto-approve -chdir=terraform'
                }
            }
        }
    }
}
