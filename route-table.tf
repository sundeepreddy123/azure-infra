resource "azurerm_route_table" "private_rt" {
  name                = "private-rt"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

