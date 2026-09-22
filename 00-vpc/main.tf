module "vpc" {
  source      = "git::https://github.com/venkat-actions/aws_vpc_module.git?ref=main"
  project     = var.project
  environment = var.environment
  # is_peering_required= true
}