
## Scalable and Secure E-Commerce Platform on AWS

This repository documents the midterm project implemented by Group 18 for ENPM 818N (University of Maryland). The goal was to build a secure, scalable, cloud-based eCommerce platform entirely using AWS services.

## Project Flow

    1. EC2 setup with Apache + PHP
    2. RDS MySQL database with SSL/TLS
    3. Application Load Balancer with HTTPS redirect
    4. Auto Scaling with CPU-based policies
    5. AWS WAF for web security
    6. CloudFront + S3 for fast static content delivery
    7. Monitoring with CloudWatch and CloudTrail
    8. Cost tracking via Cost Explorer

## Features

- EC2 hosting and Auto Scaling
- MySQL on RDS with Multi-AZ and SSL
- Application Load Balancer (ALB) for routing
- AWS WAF protection (SQLi, XSS)
- HTTPS via ACM and Route 53
- CloudFront + S3 integration
- JMeter load testing
- CloudWatch logs and alarms
- Cost optimization insights

## Folder Structure

- scripts/ - Phase-wise deployment scripts 
- app/connect.php - Secure DB connection script
- images/ - Architecture diagrams and screenshots
- final/ - Final report and PPT

## Notes

- This project was deployed **manually** using the AWS Console and CLI. No CloudFormation or Terraform was used.
- We faced and resolved real-world issues including HTTP to HTTPS migration, EC2-RDS connection errors, and cost estimation mismatches.
- The base web app was cloned from: https://github.com/edaviage/818N-E_Commerce_Application

