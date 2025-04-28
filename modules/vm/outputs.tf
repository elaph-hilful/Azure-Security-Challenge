output "public_ip" {
  value = azurerm_public_ip.bastion.ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "principal_id" {
  value = azurerm_linux_virtual_machine.this.identity[0].principal_id
}

output "nic_id" {
  value = azurerm_network_interface.this.id
}
