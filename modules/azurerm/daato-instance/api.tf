locals {
  api_env = {
    MAX_REPORTING_STRUCTURE_LEVELS     = data.coder_parameter.max_reporting_structure_levels.value
    DB_URL                             = var.mongodb_connection_string
    ENV_NAME                           = local.instance.identifier
    EXTERNAL_REDIS_HOST                = data.kubernetes_secret.redis.data.hostname
    EXTERNAL_REDIS_PORT                = tostring(data.kubernetes_secret.redis.data.port)
    EXTERNAL_REDIS_TLS_HOST            = data.kubernetes_secret.redis.data.hostname
    EXTERNAL_REDIS_PASSWORD            = data.kubernetes_secret.redis.data.password
    EXTERNAL_REDIS_QUEUE_PREFIX        = "${local.instance.identifier}-production"
    FRONTEND_URL                       = "https://${azurerm_linux_web_app.frontend.default_hostname}"
    SENDGRID_TOKEN                     = data.kubernetes_secret.sendgrid_credentials.data.token
    KEYCLOAK_URL                       = data.kubernetes_secret.keycloak_credentials.data.url
    KEYCLOAK_CLIENT_ID                 = keycloak_openid_client.core.client_id
    KEYCLOAK_CLIENT_SECRET             = keycloak_openid_client.core.client_secret
    KEYCLOAK_REALM                     = keycloak_realm.this.realm
    KEYCLOAK_CORE_REALM                = local.instance.core_identifier
    KEYCLOAK_API_CLIENT_ID             = keycloak_openid_client.api.client_id
    KEYCLOAK_API_CLIENT_SECRET         = keycloak_openid_client.api.client_secret
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
      docker_registry_url = "https://daatodev.azurecr.io"
      docker_image_name   = "api:main"
    }
  }
  app_settings = local.api_env
}

