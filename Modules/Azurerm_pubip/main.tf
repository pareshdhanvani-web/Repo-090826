resource "azurerm_public_ip" "pip"{
    for_each=var.pips
    name=each.value.name
    resource_group_name=each.value.rgname
    location=each.value.loc
    allocation_method="Static"
    tags=each.value.tags
}