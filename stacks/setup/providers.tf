provider "azurerm" {
  alias = "default"
  features {}
}
data "azurerm_subscriptions" "common" {
  provider              = azurerm.default
  display_name_contains = "common"
}
provider "azurerm" {
  alias = "common"
  features {}
  subscription_id = data.azurerm_subscriptions.common.subscriptions[0].subscription_id
}
provider "auth0" {
  domain        = var.auth0.domain
  client_id     = var.auth0.client_id
  client_secret = var.auth0.client_secret
}
