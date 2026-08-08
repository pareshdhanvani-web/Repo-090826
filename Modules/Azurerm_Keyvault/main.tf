resource "azurerm_key_vault" "kv" {
    for_each=var.kv
    name=each.value.keyvault_name
    resource_group_name = each.value.rg_name
    location=each.value.location
    sku_name="standard"
    rbac_authorization_enabled = false
    purge_protection_enabled=false
    soft_delete_retention_days = 7
    tenant_id = data.azurerm_client_config.current.tenant_id
}
data "azurerm_client_config" "current"{}

resource "azurerm_key_vault_secret" "vm_password" {
    for_each=var.kv
    name="vm-password"
    value="Azure@123"
    key_vault_id=azurerm_key_vault.kv[each.key].id
  
}
