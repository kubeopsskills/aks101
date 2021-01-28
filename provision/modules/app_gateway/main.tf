resource "azurerm_application_gateway" "aks_app_gateway" {
  name                = "${var.company}_${var.project}_${var.environment}_${var.app_gw_name}"
  resource_group_name = var.app_gw_resource_group_name
  location            = var.location

  sku {
    name     = var.app_gw_sku_name
    tier     = var.app_gw_sku_tier
    capacity = var.app_gw_sku_capacity
  }

  gateway_ip_configuration {
    name      = "${var.app_gw_name}-config"
    subnet_id = var.app_gw_frontend_subnet_id
  }

  frontend_port {
    name = "${var.app_gw_name}-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${var.app_gw_name}-frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.aks_app_gateway_public_ip.id
  }

  http_listener {
    name                           = "${var.app_gw_name}-http-listener"
    frontend_ip_configuration_name = "${var.app_gw_name}-frontend-ip-config"
    frontend_port_name             = "${var.app_gw_name}-frontend-port"
    protocol                       = "Http"
  }

  backend_address_pool {
    name = "${var.app_gw_name}-backend-address-pool"
  }

  backend_http_settings {
    name                  = "${var.app_gw_name}-backend-http-settings"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  request_routing_rule {
    name                       = "${var.app_gw_name}-request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.app_gw_name}-http-listener"
    backend_address_pool_name  = "${var.app_gw_name}-backend-address-pool"
    backend_http_settings_name = "${var.app_gw_name}-backend-http-settings"
  }

  depends_on = [
    azurerm_public_ip.aks_app_gateway_public_ip
  ]
}