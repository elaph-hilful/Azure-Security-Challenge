output "public_ip" {
  value = module.vm.public_ip
}

output "keyvault_uri" {
  value = module.keyvault.vault_uri
}

