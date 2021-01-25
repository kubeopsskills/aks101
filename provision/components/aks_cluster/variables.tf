variable "company" {
  description = "Company Name"
}

variable "environment" {
  description = "Project Environment"
}

variable "project" {
  description = "Project Name"
}

variable "location" {
  description = "Project Location"
}

variable "aks_resource_group_name" {
  description = "AKS Resource Group Name"
}

variable "aks_subnet_id" {
  description = "AKS Subnet ID"
}

variable "aks_node_vm_size" {
  description = "AKS Node VM Size"
}

variable "aks_node_enable_public_ip" {
  type = bool
  description = "AKS Node Enabled Public IP"
}

variable "aks_node_availability_zones" {
  type = list
  description = "AKS Node Availability Zones"
}

variable "aks_enable_auto_scaling" {
  type = bool
  description = "AKS Enable Auto Scaling"
}

variable "aks_node_count" {
  description = "AKS Node Count"
}

variable "aks_node_min" {
  description = "AKS Node Min"
}

variable "aks_node_max" {
  description = "AKS Node Max"
}

variable "aks_node_labels" {
  type = map
  description = "AKS Node Labels"
}

variable "kubernetes_version_prefix" {
  description = "Kubernetes Version Prefix"
}

variable "aks_managed_identity_assignment_scope" {
  description = "AKS Managed Identity Assignment Scope"
}

variable "client_app_id" {
  description = "Client App ID"
}

variable "server_app_id" {
  description = "Server App ID"
}

variable "server_app_secret" {
  description = "Server App Secret"
}

variable "tenant_id" {
  description = "Tenant ID"
}