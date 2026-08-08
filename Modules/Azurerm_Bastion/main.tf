resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion
  name                = each.value.name
  resource_group_name = each.value.rgname
  location            = each.value.loc
  ip_configuration {
    name                 = each.value.ipconfigname
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id

  }

}
