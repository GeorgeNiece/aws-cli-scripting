#!/usr/bin/env python

BUCKET =  "aws-sam-cli-managed-default-samclisourcebucket-rmyj7egg5b7m"
import boto3

s3 = boto3.resource('s3')
bucket = s3.Bucket(BUCKET)
bucket.object_versions.delete()

# if you want to delete the now-empty bucket as well, uncomment this line:
#bucket.delete()
