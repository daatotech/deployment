locals {
  api_env = {
    DB_URL                              = azurerm_cosmosdb_account.this.connection_strings[0]
    JWT_AUDIENCE                        = var.auth0.resource_servers.api
    ENV_NAME                            = var.identifier
    AUTH0_DOMAIN                        = var.auth0.domain
    AUTH0_MANAGEMENT_CLIENT_ID          = var.auth0.clients.management.client_id
    AUTH0_MANAGEMENT_CLIENT_SECRET      = var.auth0.clients.management.client_secret
    AUTH0_ORGANIZATION_ID               = var.auth0.organization_id
    AUTH0_CONTRIBUTOR_ROLE_ID           = var.auth0.roles.contributor
    AUTH0_ISOLATED_CONTRIBUTOR_ROLE_ID  = var.auth0.roles.isolated_contributor
    AUTH0_GROUP_MANAGER_ROLE_ID         = var.auth0.roles.group_manager
    AUTH0_SUBSIDIARY_MANAGER_ROLE_ID    = var.auth0.roles.subsidiary_manager
    AUTH0_ADMIN_ROLE_ID                 = var.auth0.roles.admin
    AUTH0_CLIENT_ID                     = var.auth0.clients.main.client_id
    CORE_AUTH0_M2M_CLIENT_ID            = var.auth0.clients.core.client_id
    CORE_AUTH0_M2M_CLIENT_SECRET        = var.auth0.clients.core.client_secret
    CORE_AUTH0_M2M_AUDIENCE             = var.auth0.resource_servers.core
    FRONTEND_URL                        = "https://${azurerm_linux_web_app.frontend.default_hostname}"
    SENDGRID_TOKEN                      = "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"
    SINGLE_ORG                          = "true"
    CORE_URL                            = var.core_api_url
    FRONTEND_DOMAIN                     = azurerm_linux_web_app.frontend.default_hostname
    PORT                                = 80
    ENABLE_LOGS                         = "true"
    ENABLE_MAIL_ON_ERROR                = "true"
    FEATURE_FLAG_FRAMEWORKS             = "1"
    NO_COLOR                            = "1"
    SERVER_ERROR_EMAIL_SENDER           = "serverlogs@daato.io"
    SERVER_ERROR_EMAILS                 = "sreeganesh@daato.net mariusz.wozniak@codete.com maciej.chamera@codete.com emil.tomczuk@daato.net ilham.muhammad@daato.net giulia.fumagalli@daato.net alina.buzhynskaya@codete.com"
    DOCKER_REGISTRY_SERVER_URL          = var.azurecr.url
    DOCKER_REGISTRY_SERVER_USERNAME     = var.azurecr.username
    DOCKER_REGISTRY_SERVER_PASSWORD     = var.azurecr.password
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    PUBLIC_CONTAINER_CONNECTION_STRING  = "DefaultEndpointsProtocol=https;AccountName=uploadtestforeng245;AccountKey=YYLUgWt+ftOx1p5S9FNNV4aKems0sZlclid9/PXait4zfG85kWrNgMoztb2dZbJKJB62DAvzgtf7+ASttsCruw==;EndpointSuffix=core.windows.net"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS  = "30"
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
      docker_image     = "daato.azurecr.io/api"
      docker_image_tag = var.identifier
    }
  }
  app_settings = local.api_env
}

