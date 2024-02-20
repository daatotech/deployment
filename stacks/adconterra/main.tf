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
module "instance" {
  source                    = "../../modules/azurerm/daato-instance"
  identifier                = var.identifier
  mongodb_connection_string = var.mongodb_connection_string
  az_location               = var.az_location
  azurecr                   = var.azurecr
  sendgrid_token            = var.sendgrid_token
  redis                     = var.redis
}
