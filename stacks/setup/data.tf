data "azurerm_container_registry" "daato" {
  provider            = azurerm.common
  resource_group_name = "daato"
  name                = "daato"
}
data "azurerm_redis_cache" "this" {
  provider            = azurerm.common
  name                = "daatodev"
  resource_group_name = "daato-development"
}
