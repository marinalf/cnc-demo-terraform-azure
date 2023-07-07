
#CNC Credentials & Azure Subscription

variable "username" {}
variable "password" {}
variable "url" {}
variable "subscription_id" {}

# Tenant + VRF

variable "tenant_name" {
  default = "devnet"
}

variable "vnet1_name" {
  default = "vnet1"
}

#Cloud Context Profile for VNets + Subnets

variable "cxt_vnet1_name" {
  default = "ctx-vnet1-uksouth"
}

variable "vnet1_cidr" {
  default = "172.11.0.0/16"
}

variable "vnet1_region" {
  default = "uksouth"
}

variable "cloud_vendor" {
  default = "azure"
}

variable "vnet1_subnets" {
  type = map(object({
    name = string
    ip   = string
  }))
  default = {
    web-subnet = {
      name = "web-subnet"
      ip   = "172.11.1.0/24"
    },
    db-subnet = {
      name = "db-subnet"
      ip   = "172.11.2.0/24"
    }
  }
}