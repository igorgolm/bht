variable "region" {
  type        = string
  description = "AWS Region"
}

variable "allowed_account_ids" {
  type        = list
  description = "Allowed AWS account IDs"
}
