locals {
  permissions = jsondecode(file("${path.module}/permissions.json"))
}
