terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "c316f505-7597-4175-b5db-d2949009d506"
  features       {}
}



resource "azurerm_resource_group" "rg1" {
  name     = "testrg1"
  location = "West US"
}

resource "azurerm_storage_account" "sg1" {
  name                     = "teaststg"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}