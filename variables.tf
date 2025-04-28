variable "location" {
  description = "Azure Region for resources"
  default = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default = "rg-secureapp"
}

variable "admin_username" {
  description = "Admin username for VM"
  default = "azureadmin"
}

variable "admin_password" {
  description = "Admin password for VM. Should be stored securely."
  sensitive   = true
}

variable "alert_email" {
  description = "Email for Logic App alerting"
}

variable "admin_object_id" {
  description = "AAD Object ID for role assignment"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed to SSH into the VM"
  type        = list(string)
}

variable "key_vault_sku" {
  description = "Key Vault SKU (standard/premium)"
  default     = "standard"
}

variable "enable_purge_protection" {
  description = "Enable Key Vault purge protection"
  default     = false
}

variable "log_retention_days" {
  description = "Log Analytics retention period"
  default     = 3
}