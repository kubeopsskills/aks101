variable "user_assigned_identity_principal_id" {
  description = "User Assigned Identity Principal ID"
}

variable "user_assigned_role_scopes" {
  description = "Role Scopes Map"
  type        = map(string)
}