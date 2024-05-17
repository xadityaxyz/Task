# Create a Python script to read data from S3 and push it to RDS or Glue Database.
import boto3
import os
import pymysql
import json
from botocore.exceptions import NoCredentialsError

# AWS configurations
S3_BUCKET = 'your-s3-bucket-name'
RDS_ENDPOINT = 'your-rds-endpoint'
RDS_PORT = 3306
RDS_USER = 'your-rds-username'
RDS_PASSWORD = 'your-rds-password'
RDS_DB_NAME = 'your-rds-db-name'

def read_from_s3(bucket, file_name):
    s3 = boto3.client('s3')
    try:
        s3_response = s3.get_object(Bucket=bucket, Key=file_name)
        data = s3_response['Body'].read().decode('utf-8')
        return data
    except NoCredentialsError:
        print("Credentials not available")
        return None

def push_to_rds(data):
    try:
        connection = pymysql.connect(host=RDS_ENDPOINT,
                                     user=RDS_USER,
                                     password=RDS_PASSWORD,
                                     database=RDS_DB_NAME,
                                     port=RDS_PORT)
        cursor = connection.cursor()
        # Assume the data is in JSON format
        records = json.loads(data)
        for record in records:
            cursor.execute("INSERT INTO your_table (column1, column2) VALUES (%s, %s)", 
                           (record['column1'], record['column2']))
        connection.commit()
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    finally:
        cursor.close()
        connection.close()
    return True

def push_to_glue(data):
    # This is a placeholder function. Implement your Glue logic here.
    print("Pushing data to Glue Database")
    return True

if __name__ == "__main__":
    data = read_from_s3(S3_BUCKET, 'data.json')
    if data:
        success = push_to_rds(data)
        if not success:
            push_to_glue(data)
