module "aks_cluster" {
    source = "../../modules/aks_cluster"
    company = var.company
    environment = var.environment
    project = var.project
    location = var.location
    aks_resource_group_name = var.aks_resource_group_name
    aks_subnet_id = var.aks_subnet_id
    aks_node_vm_size = var.aks_node_vm_size
    aks_node_enable_public_ip = var.aks_node_enable_public_ip
    aks_node_availability_zones = var.aks_node_availability_zones
    aks_enable_auto_scaling = var.aks_enable_auto_scaling
    aks_node_count = var.aks_node_count
    aks_node_min = var.aks_node_min
    aks_node_max = var.aks_node_max
    aks_node_labels = var.aks_node_labels
    kubernetes_version_prefix = var.kubernetes_version_prefix
    aks_managed_identity_assignment_scope = var.aks_managed_identity_assignment_scope
    client_app_id = var.client_app_id
    server_app_id = var.server_app_id
    server_app_secret = var.server_app_secret
    tenant_id = var.tenant_id
}

provider "azure" {
  features {}
}

terraform {
  required_providers {
    azure = {
      source  = "hashicorp/azurerm"
      version = "=2.40.0"
    }
  }
}