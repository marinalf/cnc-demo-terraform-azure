
#CNC Credentials & Azure Subscription

variable "username" {}
variable "password" {}
variable "url" {}
variable "subscription_id" {}

# Tenant + VRF

variable "tenant_name" {
  default = "devnet"
}

variable "vrf_name" {
  default = "vrf-1"
}

# VNet Peering

variable "vnet_peering" {
  description = "VNet Peering to infra hub VNet is enabled by default"
  default     = "default"
}
#Cloud Context Profile (VPC) + Subnets

variable "cxt_name" {
  default = "ctx-vrf1-uksouth"
}

variable "cxt_cidr" {
  default = "172.11.0.0/16"
}

variable "cxt_region" {
  default = "uksouth"
}

variable "cloud_vendor" {
  default = "azure"
}

variable "user_subnets" {
  type = map(object({
    name = string
    ip   = string
    zone = string
  }))
  default = {
    web-subnet = {
      name = "web-subnet"
      ip   = "172.11.1.0/24"
      zone = "uksouth"
    },
    db-subnet = {
      name = "db-subnet"
      ip   = "172.11.2.0/24"
      zone = "uksouth"
    }
  }
}

# EPGs + Contract + Filter

variable "app_profile" {
  default = "MyApp"
}

variable "epg_web" {
  default = "Web"
}

variable "selector_web" {
  default = "Web"
}

variable "ip_based" {
  default = "IP=='172.11.1.0/24'"
}

variable "epg_db" {
  default = "DB"
}

variable "selector_db" {
  default = "DB"
}

variable "tag_based" {
  default = "custom:Name=='db-vm'"
}

variable "contract_name" {
  default = "web-to-db"
}

variable "filter_name" {
  default = "web-to-db"
}

# Internet External EPG + Contract + Filter

variable "epg_internet" {
  default = "Internet"
}

variable "selector_internet" {
  default = "Internet"
}

variable "subnet_internet" {
  default = "0.0.0.0/0"
}

variable "contract_name_internet" {
  default = "internet-access"
}

variable "filter_name_internet" {
  default = "internet-access"
}