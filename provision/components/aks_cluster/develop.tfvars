company = "kubeopsskills"
environment = "develop"
project = "cloudnative"
location = "Southeast Asia"

aks_resource_group_name = "kubeopsskills_cloudnative_develop_rg"
aks_subnet_id = "/subscriptions/a9d3f30c-c06f-4536-a7c1-93dcf16414c2/resourceGroups/kubeopsskills_cloudnative_develop_rg/providers/Microsoft.Network/virtualNetworks/kubeopsskills_cloudnative_develop_vnet/subnets/kubeopsskills_cloudnative_develop_subnet"
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
kubernetes_version_prefix = 1.18
aks_managed_identity_assignment_scope = "/subscriptions/a9d3f30c-c06f-4536-a7c1-93dcf16414c2/resourceGroups/kubeopsskills_cloudnative_develop_rg"

client_app_id = 
server_app_id = 
server_app_secret = 
tenant_id = 