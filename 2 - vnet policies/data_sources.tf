data "aci_cloud_account" "cloud_provider" {
  tenant_dn  = "uni/tn-infra"
  account_id = var.subscription_id
  vendor     = "azure"
}

data "aci_tenant" "tenant1" {
  name        = var.tenant_name
  description = "This tenant has been created by Terraform"
}

data "aci_vrf" "vnet1" {
  tenant_dn = data.aci_tenant.tenant1.id
  name      = var.vnet1_name
}
