#!/bin/bash
# Phase 2: Security Setup

# Enable SSL with ACM
aws acm request-certificate \
  --domain-name yourdomain.com \
  --validation-method DNS

# Configure WAF
aws wafv2 create-web-acl \
  --name ecommerce-waf \
  --scope CLOUDFRONT \
  --default-action Allow={} \
  --visibility-config SampledRequestsEnabled=true,CloudWatchMetricsEnabled=true,MetricName="waf-metric" \
  --rules file://waf-rules.json

# Enable SSL/TLS for RDS connection
# (done in RDS param group in console or CLI)
