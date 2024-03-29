resource "azurerm_linux_web_app" "frontend" {
  name                = "daato-frontend-${var.identifier}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  service_plan_id     = azurerm_service_plan.this.id
  https_only          = true
  site_config {
    application_stack {
      docker_registry_url = "https://${var.azurecr.url}"
      docker_image_name   = "frontend:main"
    }
  }
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL      = var.azurecr.url
    DOCKER_REGISTRY_SERVER_USERNAME = var.azurecr.username
    DOCKER_REGISTRY_SERVER_PASSWORD = var.azurecr.password
  }
}
