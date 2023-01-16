
# Outputs for VM deployment


output "rg-name" {
  value = "CNC_${data.aci_tenant.terraform_ten.name}_${aci_vrf.vrf1.name}_${aci_cloud_context_profile.ctx-vrf1.region}"
}

output "vnet" {
  value = aci_vrf.vrf1.name
}

output "region" {
  value = aci_cloud_context_profile.ctx-vrf1.region
}

output "web-subnet" {
  value = aci_cloud_subnet.cloud_subnet_user["web-subnet"].name
}

output "db-subnet" {
  value = aci_cloud_subnet.cloud_subnet_user["db-subnet"].name
}