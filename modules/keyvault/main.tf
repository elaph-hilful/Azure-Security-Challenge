resource "azurerm_key_vault" "this" {
  name                        = "${var.name}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  enable_rbac_authorization   = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = [
      "103.197.206.34"
    ]
  }

}

resource "azurerm_role_assignment" "keyvault_access" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.principal_id  
#   depends_on = [
#     azurerm_role_assignment.kv_admin  # Ensure the Key Vault Admin role is applied before this
#   ]
}



resource "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  value        = "SomeSecurePassword123!"
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [azurerm_role_assignment.keyvault_access]
}

