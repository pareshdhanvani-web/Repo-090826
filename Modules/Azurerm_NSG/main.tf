resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  resource_group_name = each.value.rgname
  location            = each.value.loc
  security_rule {
    name      = each.value.nsgrule_name
    priority  = 100
    direction = "Inbound"
    access    = "Allow"
    protocol  = "Tcp"

    source_port_range       = "*"
    destination_port_ranges = ["80", "443", "8080"]

    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each                  = var.nsg
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
}
data "azurerm_subnet" "subnet" {
  for_each             = var.nsg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rgname

}
