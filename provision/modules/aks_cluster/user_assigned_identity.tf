resource "azurerm_user_assigned_identity" "aks_user_assigned_identity" {
  resource_group_name = var.aks_resource_group_name
  location            = var.location
  name = "${var.company}-${var.project}-${var.environment}-aks_user-assigned-identity"
}

resource "azurerm_role_assignment" "managed_identity_operator_assignment" {
  scope                = var.aks_managed_identity_assignment_scope
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.aks_user_assigned_identity.principal_id
  depends_on = [
    azurerm_user_assigned_identity.aks_user_assigned_identity,
    azurerm_kubernetes_cluster.aks_cluster
  ]
}

resource "azurerm_role_assignment" "virtual_machine_operator_assignment" {
  scope                = var.aks_managed_identity_assignment_scope
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_user_assigned_identity.principal_id
  depends_on = [
    azurerm_user_assigned_identity.aks_user_assigned_identity,
    azurerm_kubernetes_cluster.aks_cluster
  ]
}