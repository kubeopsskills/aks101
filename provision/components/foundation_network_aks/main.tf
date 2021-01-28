module "foundation_network_aks" {
    source = "../../modules/foundation_network_aks"
    company = var.company
    environment = var.environment
    project = var.project
    location = var.location
    vnet_address_space = var.vnet_address_space
    subnet_address_space = var.subnet_address_space
    public_subnet_address_space = var.public_subnet_address_space
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