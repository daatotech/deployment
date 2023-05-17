variable "identifier" {
  type = string
}
variable "az_location" {
  type = string
}
variable "auth0" {}
variable "azurecr" {
  type = object({
    url      = string
    username = string
    password = string
  })
}
variable "core_api_url" {
  type = string
}
variable "sendgrid_token" {
  type = string
}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}
module "instance" {
  source         = "../../modules/azurerm/daato-instance"
  identifier     = var.identifier
  az_location    = var.az_location
  auth0          = var.auth0
  core_api_url   = var.core_api_url
  azurecr        = var.azurecr
  sendgrid_token = var.sendgrid_token
}
