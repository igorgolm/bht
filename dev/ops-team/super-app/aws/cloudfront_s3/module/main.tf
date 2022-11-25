resource "aws_cloudfront_distribution" "s3_bucket" {
  enabled             = true
  default_root_object = "index.html"
  aliases             = var.cloudfront_aliases

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.target_bucket_name
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    min_ttl     = 3200
    default_ttl = 5400
    max_ttl     = 7200

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }

  origin {
    domain_name = var.s3_domain_name
    origin_id   = var.target_bucket_name
    origin_access_control_id  = aws_cloudfront_origin_access_control.oac.id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_cert_arn
    ssl_support_method       = "sni-only"
  }

depends_on = [
  aws_cloudfront_origin_access_control.oac
]

}