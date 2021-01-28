company = "kubeopsskills"
environment = "develop"
project = "cloudnative"
location = "Southeast Asia"

user_assigned_identity_resource_group_name = "kubeopsskills_cloudnative_develop_node_rg"
user_assigned_identity_name = "aks_ingress_identity"
user_assigned_role_scopes = {
   "Contributor": "/subscriptions/3682cfc7-582d-46de-82e9-c895ca6c421c/resourceGroups/kubeopsskills_cloudnative_develop_node_rg/providers/Microsoft.Network/applicationGateways/kubeopsskills_cloudnative_develop_aks_ingress"
   "Reader": "/subscriptions/3682cfc7-582d-46de-82e9-c895ca6c421c/resourceGroups/kubeopsskills_cloudnative_develop_node_rg"
}