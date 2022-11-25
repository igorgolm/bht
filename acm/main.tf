module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.2.0"

  domain_name = var.domain_name
  zone_id     = var.zone_id

  subject_alternative_names = [
    "*.${var.domain_name}",
  ]

  wait_for_validation = true
}