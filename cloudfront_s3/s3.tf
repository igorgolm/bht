resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    ManagedBy = "TerraformCloud"
  }

}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  acl    = var.s3_bucket_acl
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  versioning_configuration {
    status = var.s3_bucket_versioning_enabled
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "cloudfront_access_policy" {

  statement {
    sid = "AllowCloudFrontServicOACReadOnly"

    actions = ["s3:GetObject"]

    effect = "Allow"

    resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]

    principals {
      type = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["arn:aws:cloudfront::${var.aws_account}:distribution/${aws_cloudfront_distribution.s3_bucket.id}"]
    }
  }

  depends_on = [
    aws_cloudfront_origin_access_control.oac,
    aws_cloudfront_distribution.s3_bucket
  ]
}

resource "aws_s3_bucket_policy" "cloudfront_access" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.cloudfront_access_policy.json
}