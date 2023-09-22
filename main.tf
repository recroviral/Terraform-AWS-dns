provider "aws" {
  region = "us-east-1"
}

locals {
  zone_id = var.zone_id
}

resource "aws_route53_record" "dns_records" {
  count = length(var.records)
  zone_id = local.zone_id
  name    = var.records[count.index].name
  type    = var.records[count.index].type
  ttl     = var.records[count.index].ttl
  records   = var.records[count.index].value
}

resource "aws_route53_record" "dns_records_alias" {
  count = length(var.records_alias)
  zone_id = local.zone_id
  name    = var.records_alias[count.index].name
  type    = var.records_alias[count.index].type
  alias {
    name                   = var.records_alias[count.index].alias.name
    zone_id                = var.records_alias[count.index].alias.zone_id
    evaluate_target_health = var.records_alias[count.index].alias.evaluate_target_health
  }
}
