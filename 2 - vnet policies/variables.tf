
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

# EPGs + Contract + Filter

variable "app_profile" {
  default = "MyApp"
}

variable "epg_web" {
  default = "Web"
}

variable "web_selector" {
  default = "Web"
}

variable "ip_based" {
  default = "IP=='172.11.1.0/24'"
}

variable "epg_db" {
  default = "DB"
}

variable "db_selector" {
  default = "DB"
}

variable "tag_based" {
  default = "custom:Name=='db-vm'"
}

variable "web_to_db_contract" {
  default = "web-to-db"
}

variable "web_to_db_filter" {
  default = "web-to-db"
}

# Internet External EPG + Contract + Filter

variable "epg_internet" {
  default = "Internet"
}

variable "internet_selector_name" {
  default = "Internet"
}

variable "internet_selector_subnet" {
  default = "0.0.0.0/0"
}

variable "internet_contract" {
  default = "internet-access"
}

variable "internet_filter" {
  default = "internet-access"
}