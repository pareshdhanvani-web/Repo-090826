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


resource "azurerm_key_vault_access_policy" "github_actions" {

  for_each = var.kv

  key_vault_id = azurerm_key_vault.kv[each.key].id

  tenant_id = data.azurerm_client_config.current.tenant_id

  # GitHub Actions Service Principal Object ID
  object_id = "8b3a1a89-7dd5-4646-a34a-7a5009033a8e"

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete"
  ]
}

resource "azurerm_key_vault_secret" "vm_password" {
    for_each=var.kv
    name="vm-password"
    value="Azure@123"
    key_vault_id=azurerm_key_vault.kv[each.key].id
  depends_on = [
    azurerm_key_vault_access_policy.github_actions
  ]
}
