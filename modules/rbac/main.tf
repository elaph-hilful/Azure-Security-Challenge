resource "azurerm_role_assignment" "vm_admin" {
  scope                = var.vm_id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = var.admin_object_id
}

resource "azurerm_role_assignment" "kv_admin" {
  scope                = var.keyvault_id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.admin_object_id
#   depends_on = [
#     azurerm_key_vault.this  # Ensure the role assignment is created before the Key Vault is accessed
#   ]
  
}
