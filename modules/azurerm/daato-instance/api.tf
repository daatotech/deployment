locals {
  api_env = {
    MAX_REPORTING_STRUCTURE_LEVELS     = "2"
    DB_URL                             = var.mongodb_connection_string
    ENV_NAME                           = var.identifier
    EXTERNAL_REDIS_HOST                = var.redis.host
    EXTERNAL_REDIS_PORT                = tostring(var.redis.port)
    EXTERNAL_REDIS_TLS_HOST            = var.redis.host
    EXTERNAL_REDIS_PASSWORD            = var.redis.password
    EXTERNAL_REDIS_QUEUE_PREFIX        = "${var.identifier}-production"
    FRONTEND_URL                       = "https://${azurerm_linux_web_app.frontend.default_hostname}"
    SENDGRID_TOKEN                     = var.sendgrid_token
    KEYCLOAK_URL                       = "https://auth.daato.app"
    KEYCLOAK_CLIENT_ID                 = var.identifier
    KEYCLOAK_CLIENT_SECRET             = var.core_client_secret
    KEYCLOAK_REALM                     = var.identifier
    KEYCLOAK_CORE_REALM                = "core"
    KEYCLOAK_API_CLIENT_ID             = "daato-api"
    KEYCLOAK_API_CLIENT_SECRET         = var.api_client_secret
    KEYCLOAK_FRONTEND_REDIRECT_URI     = "https://${azurerm_linux_web_app.frontend.default_hostname}"
    CORE_URL                           = "https://core.daato.app"
    FRONTEND_DOMAIN                    = azurerm_linux_web_app.frontend.default_hostname
    PORT                               = "80"
    ENABLE_LOGS                        = "true"
    ENABLE_MAIL_ON_ERROR               = "true"
    FEATURE_FLAG_FRAMEWORKS            = "1"
    NO_COLOR                           = "1"
    SERVER_ERROR_EMAIL_SENDER          = "serverlogs@daato.io"
    SERVER_ERROR_EMAILS                = "sreeganesh@daato.net mariusz.wozniak@codete.com maciej.chamera@codete.com emil.tomczuk@daato.net ilham.muhammad@daato.net giulia.fumagalli@daato.net alina.buzhynskaya@codete.com"
    PUBLIC_CONTAINER_CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=uploadtestforeng245;AccountKey=YYLUgWt+ftOx1p5S9FNNV4aKems0sZlclid9/PXait4zfG85kWrNgMoztb2dZbJKJB62DAvzgtf7+ASttsCruw==;EndpointSuffix=core.windows.net"
  }
}
resource "azurerm_linux_web_app" "api" {
  name                = "daato-api-${var.identifier}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  service_plan_id     = azurerm_service_plan.this.id
  https_only          = true
  site_config {
    application_stack {
      docker_registry_url = "https://${var.azurecr.url}"
      docker_image_name   = "api:main"
    }
  }
  app_settings = local.api_env
}

