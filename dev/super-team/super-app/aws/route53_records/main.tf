module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "2.10.1"

  zone_name = var.zone_name

  records = [
    {
      name    = "super"
      type    = "CNAME"
      ttl     = 3600
      records = [
        var.cloudfront_dns,
      ]
    },
  ]
}