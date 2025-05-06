#!/bin/bash

# --- Phase 1: Infrastructure Setup ---
sudo yum update -y
sudo yum install -y httpd php mysql php-mysqlnd
sudo systemctl start httpd
sudo systemctl enable httpd
# Upload the web app code here manually or via scp

# --- Phase 2: Security Setup ---
# SSL certificate is handled via ACM in AWS Console
# Route 53 configured with hosted zone and domain
# WAF created and associated with ALB in Console

# --- Phase 3: CDN + Performance ---
aws s3 mb s3://your-static-assets-bucket
aws s3 sync ./static/ s3://your-static-assets-bucket
# CloudFront distribution setup done via AWS Console
# GZIP & cache policies configured

# --- Phase 4: Monitoring & Scaling ---
# CloudWatch alarms for CPU threshold
aws cloudwatch put-metric-alarm \
  --alarm-name "HighCPUUtilization" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 70 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=AutoScalingGroupName,Value=your-asg-name \
  --evaluation-periods 2 \
  --alarm-actions arn:aws:sns:your-topic-arn \
  --unit Percent

# CloudTrail & Logs were set up in AWS Console manually
