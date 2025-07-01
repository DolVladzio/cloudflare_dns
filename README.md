# Terraform Cloudflare DNS Configuration

This Terraform configuration automates the creation and management of DNS records in Cloudflare using the `cloudflare` provider. It leverages variables for dynamic configurations and utilizes local values for record transformation.

---

## Prerequisites

1. **Terraform Installed**:
   - Install Terraform from [HashiCorp's website](https://www.terraform.io/downloads).
   - Ensure the version meets the requirements for the Cloudflare provider (`~> 5.x`).

2. **Cloudflare API Token**:
   - Generate an API token with the appropriate permissions:
     - **Zone:Read**
     - **Zone:DNS:Edit**
   - Save the token securely, as it will be required for configuration.

3. **Cloudflare Zone ID**:
   - Obtain the `zone_id` for the desired domain using the Cloudflare dashboard or API.

---

## Configuration

### Variables
Define the following variables in a `terraform.tfvars` file or via environment variables:

- `cloudflare_api_token` (string): The API token for Cloudflare authentication.
- `cloudflare_zone_id` (string): The ID of the Cloudflare zone where DNS records will be created.
- `dns_records_config` (list of objects): DNS record configurations.
- `resource_dns_map` (map of strings): Optional mappings for DNS resource values.
---
