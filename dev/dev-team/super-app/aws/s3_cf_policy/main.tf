module "s3" {
  source  = "./module"

  aws_account        = var.aws_account
  s3_bucket_arn      = var.s3_bucket_arn
  cf_distribution_id = var.cf_distribution_id
  s3_bucket_name     = var.s3_bucket_name
}