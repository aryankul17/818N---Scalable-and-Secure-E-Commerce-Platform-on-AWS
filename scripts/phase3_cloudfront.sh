#!/bin/bash
# Phase 3: CloudFront and Performance

# Create S3 bucket for static content
aws s3 mb s3://ecommerce-static-assets

# Upload static files
aws s3 cp ./static/ s3://ecommerce-static-assets --recursive

# Create CloudFront distribution
aws cloudfront create-distribution \
  --origin-domain-name ecommerce-static-assets.s3.amazonaws.com \
  --default-root-object index.html \
  --default-cache-behavior file://cache-config.json
