locals {
  zone_id = var.zone_id
}

resource "aws_route53_record" "dns_records" {
  count = length(var.records)
  zone_id = local.zone_id
  name    = var.records[count.index].Name
  type    = var.records[count.index].Type
  ttl     = var.records[count.index].TTL
  records   = var.records[count.index].Value
}

resource "aws_route53_record" "dns_records_alias" {
  count = length(var.records_alias)
  zone_id = local.zone_id
  name    = var.records_alias[count.index].Name
  type    = var.records_alias[count.index].Type
  alias {
    name                   = var.records_alias[count.index].alias.DNSName
    zone_id                = var.records_alias[count.index].alias.HostedZoneId
    evaluate_target_health = var.records_alias[count.index].alias.EvaluateTargetHealth
  }
}
