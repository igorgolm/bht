module "cloudfront_s3" {
  source  = "./module"

  cloudfront_aliases = var.cloudfront_aliases
  s3_domain_name     = var.s3_domain_name
  acm_cert_arn       = var.acm_cert_arn
  target_bucket_name = var.target_bucket_name
}