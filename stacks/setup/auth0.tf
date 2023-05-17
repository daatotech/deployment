module "auth0" {
  for_each            = { for instance in var.instances : instance.identifier => instance }
  source              = "../../modules/auth0"
  api_host            = each.value.api_host
  core_api_identifier = each.value.core_api_identifier
  logo_url            = each.value.logo_url
  prefix              = each.value.identifier
  ui_host             = each.value.ui_host
}
