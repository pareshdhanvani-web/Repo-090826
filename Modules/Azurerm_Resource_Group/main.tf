resource"azurerm_resource_group" "rg"{
    for_each=var.rgs
    name=each.value.name
    location=each.value.loc
    managed_by=each.value.mb
    tags=each.value.tags
}