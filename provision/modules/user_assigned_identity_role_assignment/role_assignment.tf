resource "azurerm_role_assignment" "user_assigned_identity_role_assignment" {
  for_each =  var.user_assigned_role_scopes
  scope                = each.value
  role_definition_name = each.key
  principal_id         = var.user_assigned_identity_principal_id
}