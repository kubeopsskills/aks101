resource "azurerm_public_ip" "aks_app_gateway_public_ip" {
  name                = "${var.company}_${var.project}_${var.environment}_${var.app_gw_name}_public_ip"
  resource_group_name = var.app_gw_resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
}