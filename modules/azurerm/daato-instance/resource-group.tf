resource "azurerm_resource_group" "this" {
  name     = "daato-${var.identifier}"
  location = var.az_location
}
