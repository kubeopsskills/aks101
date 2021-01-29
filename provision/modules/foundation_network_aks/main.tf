resource "azurerm_resource_group" "aks_resource_group" {
  name     = "${var.company}-${var.project}-${var.environment}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.company}-${var.project}-${var.environment}-vnet"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.aks_resource_group.location
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  depends_on = [
    azurerm_resource_group.aks_resource_group
  ]
}

resource "azurerm_subnet" "aks_private_subnet" {
  name                 = "${var.company}-${var.project}-${var.environment}-private-subnet"
  resource_group_name  = azurerm_resource_group.aks_resource_group.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.private_subnet_address_space]
  depends_on = [
    azurerm_virtual_network.aks_vnet
  ]
}

resource "azurerm_subnet" "aks_public_subnet" {
  name                 = "${var.company}-${var.project}-${var.environment}-public-subnet"
  resource_group_name  = azurerm_resource_group.aks_resource_group.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.public_subnet_address_space]
  depends_on = [
    azurerm_virtual_network.aks_vnet
  ]
}