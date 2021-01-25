resource "azuread_application" "aks_azuread_server" {
  display_name            = "${var.company}_${var.project}_${var.environment}_aksServer"
  type                    = "native"
  identifier_uris         = ["https://${var.company}_${var.project}_${var.environment}_aksServer"]
  group_membership_claims = "All"
  
  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }

    resource_access {
      id   = "06da0dbc-49e2-44d2-8312-53f166ab848a"
      type = "Scope"
    }

    resource_access {
      id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
      type = "Role"
    }   
  }
}

resource "azuread_service_principal" "aks_azuread_server_principal" {
  application_id = azuread_application.aks_azuread_server.application_id
}
resource "azuread_service_principal_password" "aks_azuread_server_principal_password" {
  service_principal_id = azuread_service_principal.aks_azuread_server_principal.id
  description          = "AKS Server Principal Password"
  value                = random_string.password_random.result
  end_date_relative    = "8760h"
}

resource "azuread_application" "aks_azuread_client" {
  display_name            = "${var.company}_${var.project}_${var.environment}_aksClient"
  type                    = "native"
  reply_urls              = ["https://${var.company}_${var.project}_${var.environment}_aksServer"]
  
  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }

  required_resource_access {
    resource_app_id = azuread_application.aks_azuread_server.application_id

    resource_access {
      id   = [for permission in azuread_application.aks_azuread_server.oauth2_permissions : permission.id][0]
      type = "Scope"
    }
  }

  depends_on = [
    azuread_application.aks_azuread_server
  ]
}

resource "random_string" "password_random" {
  length  = 16
  special = true

  keepers = {
    service_principal = azuread_service_principal.aks_azuread_server_principal.id
  }
}

resource "azuread_service_principal" "aks_azuread_client_principal" {
  application_id = azuread_application.aks_azuread_client.application_id
}