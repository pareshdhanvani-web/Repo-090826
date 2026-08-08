data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.subnet_vnet_name
  resource_group_name  = each.value.rgname

}