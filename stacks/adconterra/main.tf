variable "azurecr" {
  type = object({
    url      = string
    username = string
    password = string
  })
}
variable "sendgrid_token" {
  type = string
}
variable "redis" {
  type = object({
    host     = string
    port     = number
    password = string
  })
}
variable "mongodb_connection_string" {
  type      = string
  sensitive = true
}
variable "az_location" {
  type = string
}
variable "identifier" {
  type = string
}
variable "core_client_secret" {
  type      = string
  sensitive = true
}
variable "api_client_secret" {
  type      = string
  sensitive = true
}
module "instance" {
  source                    = "../../modules/azurerm/daato-instance"
  identifier                = var.identifier
  mongodb_connection_string = var.mongodb_connection_string
  az_location               = var.az_location
  azurecr                   = var.azurecr
  sendgrid_token            = var.sendgrid_token
  redis                     = var.redis
  api_client_secret         = var.api_client_secret
  core_client_secret        = var.core_client_secret
}
