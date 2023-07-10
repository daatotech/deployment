variable "instances" {
  type = list(object({
    identifier          = string
    cloud               = string
    logo_url            = string
    core_api_identifier = string
    core_api_url        = string
    api_host            = string
    ui_host             = string
    single_org          = bool
  }))
}
variable "auth0" {
  type = object({
    domain        = string
    client_id     = string
    client_secret = string
  })
}
variable "sendgrid_token" {
  type = string
}
