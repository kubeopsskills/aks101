company = "kubeopsskills"
environment = "develop"
project = "cloudnative"
location = "Southeast Asia"
aks_resource_group_name = "kubeopsskills-cloudnative-develop-rg"
aks_node_resource_group_name = "MC_kubeopsskills-cloudnative-develop-rg_cloudnative-develop-aks_southeastasia"
aks_subnet_id = "/subscriptions/3682cfc7-582d-46de-82e9-c895ca6c421c/resourceGroups/kubeopsskills-cloudnative-develop-rg/providers/Microsoft.Network/virtualNetworks/kubeopsskills-cloudnative-develop-vnet/subnets/kubeopsskills-cloudnative-develop-private-subnet"
aks_node_user_pool_name = "kuser"
aks_node_vm_size = "Standard_D2a_v4"
aks_node_enable_public_ip = false
aks_node_availability_zones = ["1", "2"]
aks_enable_auto_scaling = true
aks_node_count = 3
aks_node_min = 3 
aks_node_max = 10
aks_node_labels = {
  "pool":"worker"
}
aks_agent_node_count = 1
kubernetes_version_prefix = 1.18
aks_managed_identity_assignment_scope = "/subscriptions/3682cfc7-582d-46de-82e9-c895ca6c421c/resourceGroups/MC_kubeopsskills-cloudnative-develop-rg_cloudnative-develop-aks_southeastasia"

tenant_id = "c91b0399-fe11-412f-a862-1fe7b725ad42"