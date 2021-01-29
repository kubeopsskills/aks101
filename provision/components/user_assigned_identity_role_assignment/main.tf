module "aks_agent_pool_role_assignment" {
    source = "../../modules/user_assigned_identity_role_assignment"
    user_assigned_identity_principal_id = var.user_assigned_identity_principal_id
    user_assigned_role_scopes = var.user_assigned_role_scopes
}

provider "azure" {
  features {}
}

terraform {
  required_providers {
    azure = {
      source  = "hashicorp/azurerm"
      version = "=2.44.0"
    }
  }
}