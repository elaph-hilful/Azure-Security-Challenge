resource "azurerm_resource_group" "this" {
  name     = "rg-secureapp"
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  name                = "secureapp"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
}

module "keyvault" {
  source              = "./modules/keyvault"
  name                = "secureapp"
  principal_id        = module.vm.principal_id
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  admin_password      = var.admin_password
}

module "vm" {
  source              = "./modules/vm"
  name                = "secureapp"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.vnet.subnet_id
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key 
  allowed_ssh_ips     = var.allowed_ssh_ips
}

module "monitoring" {
  source              = "./modules/monitoring"
  name                = "secureapp"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  vm_id               = module.vm.vm_id
  alert_email         = var.alert_email
}

module "rbac" {
  source          = "./modules/rbac"
  vm_id           = module.vm.vm_id
  keyvault_id     = module.keyvault.vault_id
  admin_object_id = var.admin_object_id
}

data "azurerm_client_config" "current" {}
