module "app_gw_user_assigned_identity" {
    source = "../../modules/user_assigned_identity"
    company = var.company
    environment = var.environment
    project = var.project
    location = var.location
    user_assigned_identity_resource_group_name = var.user_assigned_identity_resource_group_name
    user_assigned_identity_name = var.user_assigned_identity_name
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