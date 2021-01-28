module "app_gateway" {
  source = "../../modules/app_gateway"
  company = var.company
  environment = var.environment
  project = var.project
  location = var.location
  app_gw_resource_group_name = var.app_gw_resource_group_name
  app_gw_frontend_subnet_id = var.app_gw_frontend_subnet_id
  app_gw_name = var.app_gw_name
  app_gw_sku_name = var.app_gw_sku_name
  app_gw_sku_tier = var.app_gw_sku_tier
  app_gw_sku_capacity = var.app_gw_sku_capacity
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