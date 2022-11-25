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
}

resource "aws_s3_bucket_policy" "cloudfront_access" {
  bucket = var.s3_bucket_id
  policy = data.aws_iam_policy_document.cloudfront_access_policy.json
}