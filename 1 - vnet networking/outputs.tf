# Outputs for VM deployment

output "rg-name" {
  value = "CNC_${aci_tenant.tenant1.name}_${aci_vrf.vnet1.name}_${aci_cloud_context_profile.ctx_vnet1.region}"
}

output "vnet" {
  value = aci_vrf.vnet1.name
}

output "region" {
  value = aci_cloud_context_profile.ctx_vnet1.region
}

output "web-subnet" {
  value = aci_cloud_subnet.vnet1_subnets["web-subnet"].name
}

output "db-subnet" {
  value = aci_cloud_subnet.vnet1_subnets["db-subnet"].name
}