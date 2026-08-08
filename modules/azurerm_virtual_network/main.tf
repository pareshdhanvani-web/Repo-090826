resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.name
  resource_group_name = each.value.rgname
  location            = each.value.loc
  address_space       = each.value.as
}