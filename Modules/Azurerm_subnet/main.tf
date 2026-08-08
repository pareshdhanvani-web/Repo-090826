resource "azurerm_subnet" "snet" {
    for_each=var.snets
    name=each.value.name
    virtual_network_name=each.value.vnet_name
    resource_group_name=each.value.rgname
    address_prefixes=each.value.ap
}