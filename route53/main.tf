module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.10.1"

  zones = {
    "wikdom.online" = {
      tags = {
        env = "dev"
      }
    }
  }

  tags = {
    ManagedBy = "TerraformCloud"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "2.10.1"

  zone_name = keys(module.zones.route53_zone_zone_id)[0]

  records = [
    {
      name    = "super"
      type    = "CNAME"
      ttl     = 3600
      records = [
        "d10k4hlzj1ooro.cloudfront.net",
      ]
    },
  ]

  depends_on = [module.zones]
}