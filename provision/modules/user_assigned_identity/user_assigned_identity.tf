resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  resource_group_name = var.user_assigned_identity_resource_group_name
  location            = var.location
  name = "${var.company}_${var.project}_${var.environment}_${var.user_assigned_identity_name}"
}

resource "azurerm_role_assignment" "user_assigned_identity_role_assignment" {
  for_each =  var.user_assigned_role_scopes
  scope                = each.value
  role_definition_name = each.key
  principal_id         = azurerm_user_assigned_identity.user_assigned_identity.principal_id
  depends_on = [
    azurerm_user_assigned_identity.user_assigned_identity,
  ]
}