##################################################################
variable "cloudflare_api_token" {}
##################################################################
variable "environment" {}
##################################################################
variable "dns_records_config" {
  description = "DNS records from config"
  type = list(object({
    name = object({
      dev  = string
      prod = string
    })
    type    = string
    proxied = bool
    value = object({
      dev  = string
      prod = string
    })
    zone_id = object({
      dev  = string
      prod = string
    })
  }))
}
##################################################################
variable "resource_dns_map" {
  description = "Map of resource names to DNS values"
}
##################################################################
