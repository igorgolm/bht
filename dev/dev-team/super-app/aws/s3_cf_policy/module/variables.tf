variable "aws_account" {
  type        = number
  description = "AWS Account ID"
}

variable "cf_distribution_id" {
  type        = string
  description = "CF distribution ID"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "s3_bucket_arn" {
  type        = string
  description = "S3 bucket ARN"
}
