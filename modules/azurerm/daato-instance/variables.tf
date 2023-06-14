variable "identifier" {
  type = string
}
variable "az_location" {
  type = string
}
variable "core_api_url" {
  type = string
}
variable "sendgrid_token" {
  type = string
}
variable "azurecr" {
  type = object({
    url      = string
    username = string
    password = string
  })
}
variable "auth0" {
  type = object({
    clients = object({
      api = object({
        client_id     = string
        client_secret = string
      })
      core = object({
        client_id     = string
        client_secret = string
      })
      main = object({
        client_id = string
      })
      management = object({
        client_id     = string
        client_secret = string
      })
    })
    domain           = string
    organization_id  = string
    resource_servers = object({
      api  = string
      core = string
    })
    roles = object({
      admin                               = string
      contributor                         = string
      group_manager                       = string
      isolated_contributor                = string
      subsidiary_manager                  = string
      scs_module_manager                  = string
      scs_supplier_relationship_manager   = string
      gen_profile_manager                 = string
      subsidiary_unit_manager             = string
      subsidiary_approver                 = string
      consulting_client_reporting_manager = string
      consulting_client_manager           = string
    })
  })
}
