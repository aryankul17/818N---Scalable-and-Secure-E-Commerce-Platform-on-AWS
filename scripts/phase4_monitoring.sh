#!/bin/bash
# Phase 4: Monitoring and Cost

# Enable CloudWatch logging for EC2
aws logs create-log-group --log-group-name ecommerce-ec2-logs

# Enable metrics + alarms
aws cloudwatch put-metric-alarm \
  --alarm-name HighCPUUtilization \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 70 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 2 \
  --alarm-actions arn:aws:sns:us-east-1:1234567890:NotifyMe \
  --dimensions Name=InstanceId,Value=i-xxxxxxxxxxxxxxx

# Cost Explorer enablement
aws ce get-cost-and-usage \
  --time-period Start=2025-05-01,End=2025-05-30 \
  --granularity MONTHLY \
  --metrics "BlendedCost"
