module "cloudfront_s3" {
  source  = "./module"

  s3_bucket_name = var.s3_bucket_name
  s3_bucket_acl  = var.s3_bucket_acl
  s3_bucket_versioning_enabled = var.s3_bucket_versioning_enabled
  cloudfront_aliases = var.cloudfront_aliases
  acm_cert_arn = var.acm_cert_arn
  aws_account  = var.aws_account
}