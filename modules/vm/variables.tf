variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "admin_username" {}
variable "ssh_public_key" {}
variable "allowed_ssh_ips" {
  type = list(string)
}
variable "enable_ddos_protection" {
  description = "Enable DDoS protection for VNet"
  default     = true
}