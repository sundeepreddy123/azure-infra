resource "azurerm_public_ip" "bastion_pip" {
  name                = "bastion-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "main" {
  name                = "main-bastion"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                 = "config"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}

