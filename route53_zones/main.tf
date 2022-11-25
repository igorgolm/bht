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