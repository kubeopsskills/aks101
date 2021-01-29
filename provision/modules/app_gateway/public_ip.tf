resource "azurerm_public_ip" "aks_app_gateway_public_ip" {
  name                = "${var.company}-${var.project}-${var.environment}-${var.app_gw_name}-public-ip"
  resource_group_name = var.app_gw_resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
}