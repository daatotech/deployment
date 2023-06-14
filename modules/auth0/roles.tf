resource "auth0_role" "contributor" {
  name        = "${var.prefix}-contributor"
  description = replace(title("${var.prefix}-contributor"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.contributor)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "isolated_contributor" {
  name        = "${var.prefix}-isolated-contributor"
  description = replace(title("${var.prefix}-isolated-contributor"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.isolated_contributor)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "group_manager" {
  name        = "${var.prefix}-group-manager"
  description = replace(title("${var.prefix}-group-manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.group_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "subsidiary_manager" {
  name        = "${var.prefix}-subsidiary-manager"
  description = replace(title("${var.prefix}-subsidiary-manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.subsidiary_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "admin" {
  name        = "${var.prefix}-admin"
  description = replace(title("${var.prefix}-admin"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.admin)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}


resource "auth0_role" "scs_module_manager" {
  name        = "${var.prefix}-scs_module_manager"
  description = replace(title("${var.prefix}-scs_module_manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.scs_module_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "scs_supplier_relationship_manager" {
  name        = "${var.prefix}-scs_supplier_relationship_manager"
  description = replace(title("${var.prefix}-scs_supplier_relationship_manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.scs_supplier_relationship_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "gen_profile_manager" {
  name        = "${var.prefix}-gen_profile_manager"
  description = replace(title("${var.prefix}-gen_profile_manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.gen_profile_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "subsidiary_unit_manager" {
  name        = "${var.prefix}-subsidiary_unit_manager"
  description = replace(title("${var.prefix}-subsidiary_unit_manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.subsidiary_unit_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "subsidiary_approver" {
  name        = "${var.prefix}-subsidiary_approver"
  description = replace(title("${var.prefix}-subsidiary_approver"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.subsidiary_approver)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "consulting_client_reporting_manager" {
  name        = "${var.prefix}-consulting_client_reporting_manager"
  description = replace(title("${var.prefix}-consulting_client_reporting_manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.consulting_client_reporting_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}

resource "auth0_role" "consulting_client_manager" {
  name        = "${var.prefix}-consulting_client_manager"
  description = replace(title("${var.prefix}-consulting_client_manager"), "-", " ")
  dynamic "permissions" {
    for_each = toset(local.permissions.consulting_client_manager)
    content {
      name                       = permissions.value
      resource_server_identifier = auth0_resource_server.this.identifier
    }
  }
}
