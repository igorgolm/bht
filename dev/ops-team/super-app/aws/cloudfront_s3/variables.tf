variable "region" {
  type        = string
  description = "AWS Region"
}

variable "cloudfront_aliases" {
  type        = list
  description = "Aliases/CNAMEs for CF origin"
}

variable "acm_cert_arn" {
  type        = string
  description = "AWS ACM cert ARN"
}
