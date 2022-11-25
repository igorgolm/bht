module "s3" {
  source  = "./module"

  s3_bucket_name = var.s3_bucket_name
  s3_bucket_acl  = var.s3_bucket_acl
  s3_bucket_versioning_enabled = var.s3_bucket_versioning_enabled
  aws_account  = var.aws_account
}