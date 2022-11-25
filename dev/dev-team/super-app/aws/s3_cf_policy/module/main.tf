data "aws_iam_policy_document" "cloudfront_access_policy" {

  statement {
    sid = "AllowCloudFrontServicOACReadOnly"

    actions = ["s3:GetObject"]

    effect = "Allow"

    resources = ["${var.s3_bucket_arn}/*"]

    principals {
      type = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["arn:aws:cloudfront::${var.aws_account}:distribution/${var.cf_distribution_id}"]
    }
  }
}

resource "aws_s3_bucket_policy" "cloudfront_access" {
  bucket = var.s3_bucket_name
  policy = data.aws_iam_policy_document.cloudfront_access_policy.json
}