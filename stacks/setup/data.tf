data "azurerm_container_registry" "daato" {
  provider            = azurerm.common
  resource_group_name = "daato"
  name                = "daato"
}
