variable "aws_region" {
  description = "AWS region to deploy regional resources (WAF Web ACL, GuardDuty detector) into."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used as a prefix/tag for all resources."
  type        = string
  default     = "security-lab"
}

variable "cloudtrail_bucket_name" {
  description = "Globally-unique S3 bucket name for CloudTrail logs."
  type        = string
}

variable "guardduty_finding_publishing_frequency" {
  description = "How often GuardDuty exports findings to CloudWatch Events/EventBridge."
  type        = string
  default     = "SIX_HOURS"
}
