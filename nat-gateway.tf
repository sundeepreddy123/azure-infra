resource "azurerm_public_ip" "nat_pip" {
  name                = "nat-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "main" {
  name                = "nat-gateway"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}
