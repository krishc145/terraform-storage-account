terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.70.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id                 = var.subscription_id
  resource_provider_registrations = "none"
}

# -----------------------------
# Existing Resource Group (KodeKloud)
# -----------------------------
data "azurerm_resource_group" "rg" {
  name = "kml_rg_main-482a0ce4bb864cd9"
}

# -----------------------------
# Storage Account
# -----------------------------
resource "azurerm_storage_account" "stg" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  tags = var.tags
}
