variable "region" {
  type        = string
  description = "AWS Region"
}

variable "allowed_account_ids" {
  type        = list
  description = "Allowed AWS account IDs"
}

variable "aws_account" {
  type        = number
  description = "AWS Account ID"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "s3_bucket_acl" {
  type        = string
  description = "S3 bucket acl"
}

variable "s3_bucket_versioning_enabled" {
  type        = string
  description = "S3 bucket versioning"
  default     = "Enabled"
}

variable "cloudfront_aliases" {
  type        = list
  description = "Aliases/CNAMEs for CF origin"
}

variable "acm_cert_arn" {
  type        = string
  description = "AWS ACM cert ARN"
}
