resource "azurerm_resource_group" "aks_resource_group" {
  name     = "${var.company}_${var.project}_${var.environment}_rg"
  location = var.location
}

resource "azurerm_resource_group" "aks_node_resource_group" {
  name     = "${var.company}_${var.project}_${var.environment}_node_rg"
  location = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.company}_${var.project}_${var.environment}_vnet"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.aks_resource_group.location
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  depends_on = [
    azurerm_resource_group.aks_resource_group
  ]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.company}_${var.project}_${var.environment}_subnet"
  resource_group_name  = azurerm_resource_group.aks_resource_group.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.subnet_address_space]
  depends_on = [
    azurerm_virtual_network.aks_vnet
  ]
}