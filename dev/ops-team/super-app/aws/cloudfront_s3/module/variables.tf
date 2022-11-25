variable "aws_account" {
  type        = number
  description = "AWS Account ID"
}

variable "target_bucket_name" {
  type        = string
  description = "S3 bucket name for CF origin"
}

variable "s3_domain_name" {
  type        = string
  description = "Target S3 bucket domain name"
}

variable "cloudfront_aliases" {
  type        = list
  description = "Aliases/CNAMEs for CF origin"
}

variable "acm_cert_arn" {
  type        = string
  description = "AWS ACM cert ARN"
}
