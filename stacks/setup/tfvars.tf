resource "local_file" "tfvars" {
  for_each = module.auth0
  filename = "${path.module}/../azure-instance/terraform.${each.key}.tfvars.json"
  content = jsonencode({
    auth0        = merge(each.value, { domain = var.auth0.domain })
    identifier   = each.key
    az_location  = "West Europe"
    core_api_url = var.instances[index(keys(module.auth0), each.key)].core_api_url
    azurecr = {
      url      = data.azurerm_container_registry.daato.login_server
      username = data.azurerm_container_registry.daato.admin_username
      password = data.azurerm_container_registry.daato.admin_password
    }
  })
}

resource "local_file" "frontend_dotenv" {
  for_each = module.auth0
  filename = "${path.module}/../../deployments/${each.key}/image/repo/apps/frontend/.env.${each.key}"
  content  = <<EOF
    NX_API_URL="${each.value.resource_servers.api}"
    NX_AUTH0_DOMAIN="${var.auth0.domain}"
    NX_AUTH0_CLIENT_ID="${each.value.clients.main.client_id}"
    NX_JWT_AUDIENCE="${each.value.resource_servers.api}"
    NX_AUTH0_ORGANIZATION_ID="${each.value.organization_id}"
    NX_DEFAULT_LANGUAGE="en"
    NX_DISABLE_EXTERNAL_CONTRIBUTORS=true
  EOF
}
