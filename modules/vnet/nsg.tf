# Azure Network Security Group
resource "azurerm_network_security_group" "nsg" {
  count               = length(var.nsg_list)
  name                = var.nsg_list[count.index].name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.tags

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Azure Network Security Group Rules
resource "azurerm_network_security_rule" "nsg_rule" {
  count                       = length(var.nsg_rule_list)
  name                        = var.nsg_rule_list[count.index].name
  priority                    = var.nsg_rule_list[count.index].priority
  direction                   = var.nsg_rule_list[count.index].direction
  access                      = var.nsg_rule_list[count.index].access
  protocol                    = var.nsg_rule_list[count.index].protocol
  source_port_range           = var.nsg_rule_list[count.index].source_port_range
  destination_port_range      = var.nsg_rule_list[count.index].destination_port_range
  source_address_prefix       = var.nsg_rule_list[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_rule_list[count.index].destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_network_security_group.nsg
  ]
}

# Azure Subnet Network Security Group Association
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  count               = length(var.subnet_list)
  subnet_id           = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [
    azurerm_subnet.subnet,
    azurerm_network_security_group.nsg
  ]
}
