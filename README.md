# Task
Step 1: Create a GitHub Repository
Go to GitHub and create a new repository.
-------------------------------------------------------------------
Step 2: Docker File and Python Script
Create the following directory structure in your repository:
├── Dockerfile
├── main.py
├── requirements.txt
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── Jenkinsfile
-----------------------------------------------------------------------------
Step 3: Push the Code to GitHub
Push your local code to the GitHub repository.
-----------------------------------------------------------------------------
Step 4: Set Up Jenkins
Install Jenkins and necessary plugins (Pipeline, Docker Pipeline, Terraform).
Create a new pipeline job in Jenkins.
Link the pipeline to your GitHub repository.
-----------------------------------------------------------------------------
Step 5: Run the Pipeline
Trigger the Jenkins pipeline.
The pipeline will initialize Terraform, create AWS resources, build the Docker image, push it to ECR, and deploy the Lambda function.
-----------------------------------------------------------------------------
Step 6: Test the Lambda Function
Go to the AWS Lambda console.
Find your deployed Lambda function.
Test the function with an appropriate test event to ensure it works as expected.
-----------------------------------------------------------------------------
Thank you 
