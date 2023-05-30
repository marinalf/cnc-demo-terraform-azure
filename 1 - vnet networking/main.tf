### Define Cloud Networking Policies ###

# Tenant and Cloud Account mapping

resource "aci_tenant" "tenant1" {
  name        = var.tenant_name
  description = "This tenant has been created by Terraform"
}

resource "aci_tenant_to_cloud_account" "cloud_acct_subscription" {
  tenant_dn        = aci_tenant.tenant1.id
  cloud_account_dn = data.aci_cloud_account.cloud_provider.id
}

/*
#if using a different subscription
resource "aci_cloud_account" "cloud_provider" {
  name        = "azure_cloud"
  tenant_dn   = aci_tenant.tenant1.id
  account_id  = var.subscription_id
  access_type = "managed"
  vendor      = "azure"
}

resource "aci_tenant_to_cloud_account" "cloud_acct_ten" {
  tenant_dn        = aci_tenant.tenant1.id
  cloud_account_dn = aci_cloud_account.cloud_provider.id
}
*/

# VRF / VNets

resource "aci_vrf" "vnet1" {
  tenant_dn = aci_tenant.tenant1.id
  name      = var.vnet1_name
}

# Cloud Context Profile for VNet + Subnets

resource "aci_cloud_context_profile" "ctx_vnet1" {
  tenant_dn                = aci_tenant.tenant1.id
  name                     = var.cxt_vnet1_name
  primary_cidr             = var.vnet1_cidr
  region                   = var.vnet1_region
  cloud_vendor             = var.cloud_vendor
  relation_cloud_rs_to_ctx = aci_vrf.vnet1.id
  hub_network              = "uni/tn-infra/gwrouterp-default" #VNet Peering is enabled by default
}

# Add Workload Subnets

resource "aci_cloud_subnet" "vnet1_subnets" {
  for_each           = var.vnet1_subnets
  cloud_cidr_pool_dn = data.aci_cloud_cidr_pool.vnet1_cidr.id
  name               = each.value.name
  ip                 = each.value.ip
}