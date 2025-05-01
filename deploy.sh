#!/bin/bash

# Configuration
S3_BUCKET="60-legacy"
S3_FOLDER="deploy-image"
AWS_REGION="ap-northeast-1"
IMAGE_NAME="ghost"
VERSION="5.115.1-alpine-c001"

# Build Docker image
# make build-prd

# Save image as .tar
echo "Saving Docker image $IMAGE_NAME:$VERSION to $IMAGE_NAME-$VERSION.tar..."
docker save -o $IMAGE_NAME-$VERSION.tar $IMAGE_NAME:$VERSION

# Upload to S3
aws s3 cp $IMAGE_NAME-$VERSION.tar s3://$S3_BUCKET/$S3_FOLDER/$IMAGE_NAME-$VERSION.tar --region $AWS_REGION

# Cleanup local file
rm $IMAGE_NAME-$VERSION.tar

echo "Upload completed: s3://$S3_BUCKET/$S3_FOLDER/$IMAGE_NAME-$VERSION.tar"