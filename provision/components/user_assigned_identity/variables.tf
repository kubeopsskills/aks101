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

variable "user_assigned_identity_resource_group_name" {
  description = "User assigned identity resource group name"
}

variable "user_assigned_identity_name" {
  description = "User assigned identity name"
}

variable "user_assigned_role_scopes" {
  description = "Role Scopes Map"
  type        = map(string)
}