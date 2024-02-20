variable "identifier" {
  type = string
}
variable "mongodb_connection_string" {
  type = string
}
variable "az_location" {
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

variable "single_org" {
  type    = bool
  default = true
}

variable "redis" {
  type = object({
    host     = string
    port     = number
    password = string
  })
}
