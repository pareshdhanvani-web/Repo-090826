resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vms
  name                            = each.value.vmname
  resource_group_name             = data.azurerm_resource_group.rg[each.key].name
  location                        = data.azurerm_resource_group.rg[each.key].location
  size                            = each.value.vmsize
  disable_password_authentication = true
  admin_username                  = "Azureuser"
  admin_password                  = data.azurerm_key_vault_secret.vm_password[each.key].value

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]
  source_image_reference {

    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  location            = data.azurerm_resource_group.rg[each.key].location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
data "azurerm_key_vault" "kv" {
  for_each            = var.vms
  name                = each.value.keyvault_name
  resource_group_name = each.value.keyvault_rgname
}
data "azurerm_key_vault_secret""vm_password"{
  for_each=var.vms
  name="vm-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
data"azurerm_resource_group""rg"{
  for_each=var.vms
  name=each.value.rgname
}
data"azurerm_subnet""subnet"{
  for_each=var.vms
  name=each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name=each.value.rgname

}
