terraform {
  backend "azurerm" {
    resource_group_name  = "daato-tfstate"
    storage_account_name = "daatotfstate"
    container_name       = "instances"
    key                  = "instances.tfstate"
  }
  required_providers {
    auth0 = {
      source = "auth0/auth0"
    }
  }
}
