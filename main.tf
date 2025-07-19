##################################################################
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}
##################################################################
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
##################################################################
locals {
  records = [
    for record in var.dns_records_config : {
      name    = record.name[var.environment]
      type    = record.type
      # value   = lookup(var.resource_dns_map, record.value, record.value)
      value   = var.resource_dns_map[record.value[var.environment]]
      proxied = lookup(record, "proxied", true)
      ttl     = lookup(record, "ttl", 1)
      zone_id = record.zone_id[var.environment]
    }
  ]
}
##################################################################
resource "cloudflare_dns_record" "dns" {
  for_each = {
    for rec in local.records : rec.name => rec
  }

  zone_id = each.value.zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.value
  ttl     = each.value.ttl
  proxied = each.value.proxied
}
##################################################################
