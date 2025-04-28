variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}
variable "admin_password" {
  description = "Sensitive admin password"
  sensitive   = true
}
variable "principal_id" {
  type    = string
  description = "The principal ID of the VM's managed identity"
}
