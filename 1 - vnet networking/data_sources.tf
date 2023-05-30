#if using the same subscription as the infra tenant
data "aci_cloud_account" "cloud_provider" {
  tenant_dn  = "uni/tn-infra"
  account_id = var.subscription_id
  vendor     = "azure"
}

data "aci_cloud_cidr_pool" "vnet1_cidr" {
  cloud_context_profile_dn = aci_cloud_context_profile.ctx_vnet1.id
  addr                     = var.vnet1_cidr
}