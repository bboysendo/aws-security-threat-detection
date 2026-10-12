output "guardduty_detector_id" {
  description = "ID of the GuardDuty detector."
  value       = aws_guardduty_detector.this.id
}

output "cloudtrail_bucket_name" {
  description = "S3 bucket holding CloudTrail logs."
  value       = aws_s3_bucket.cloudtrail.id
}

output "cloudtrail_arn" {
  description = "ARN of the CloudTrail trail."
  value       = aws_cloudtrail.this.arn
}

output "web_acl_arn" {
  description = "ARN of the WAF Web ACL — pass to 'aws wafv2 associate-web-acl' to enforce it on a resource."
  value       = aws_wafv2_web_acl.this.arn
}
