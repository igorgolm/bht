
resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "cloudfront_oac"
  description                       = "OAC for CloudFront"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}