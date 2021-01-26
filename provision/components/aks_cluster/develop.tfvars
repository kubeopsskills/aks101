company = "kubeopsskills"
environment = "develop"
project = "cloudnative"
location = "Southeast Asia"
aks_resource_group_name = "kubeopsskills_cloudnative_develop_rg"
aks_node_resource_group_name = "kubeopsskills_cloudnative_develop_node_rg"
aks_subnet_id = "/subscriptions/3682cfc7-582d-46de-82e9-c895ca6c421c/resourceGroups/kubeopsskills_cloudnative_develop_rg/providers/Microsoft.Network/virtualNetworks/kubeopsskills_cloudnative_develop_vnet/subnets/kubeopsskills_cloudnative_develop_subnet"
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
aks_managed_identity_assignment_scope = "/subscriptions/3682cfc7-582d-46de-82e9-c895ca6c421c/resourceGroups/kubeopsskills_cloudnative_develop_node_rg"

tenant_id = "c91b0399-fe11-412f-a862-1fe7b725ad42"