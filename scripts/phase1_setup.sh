#!/bin/bash
# Phase 1: Initial Infrastructure Setup

# Launch EC2 instance (Amazon Linux 2)
aws ec2 run-instances \
  --image-id ami-0abcdef1234567890 \
  --count 1 \
  --instance-type t2.micro \
  --key-name my-key \
  --security-group-ids sg-xxxxxxx \
  --subnet-id subnet-xxxxxxx \
  --user-data file://install_apache.sh

# Create RDS MySQL instance
aws rds create-db-instance \
  --db-instance-identifier ecommerce-db \
  --db-instance-class db.t2.micro \
  --engine mysql \
  --allocated-storage 20 \
  --master-username admin \
  --master-user-password YourPassword123 \
  --vpc-security-group-ids sg-xxxxxxx \
  --multi-az \
  --storage-encrypted \
  --backup-retention-period 7

# Create an Application Load Balancer (ALB)
aws elbv2 create-load-balancer \
  --name ecommerce-alb \
  --subnets subnet-xxxx subnet-yyyy \
  --security-groups sg-xxxxxxx

