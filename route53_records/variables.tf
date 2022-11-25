variable "region" {
  type        = string
  description = "AWS Region"
}

variable "zone_name" {
  type        = string
  description = "AWS DNS zone_name"
}

variable "cloudfront_dns" {
  type        = string
  description = "CF distribution DNS"
}