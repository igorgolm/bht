variable "region" {
  type        = string
  description = "AWS Region"
}

variable "domain_name" {
  type        = string
  description = "Domain Name for TLS cert"
}

variable "zone_id" {
  type        = string
  description = "AWS DNS zone ID"
}
