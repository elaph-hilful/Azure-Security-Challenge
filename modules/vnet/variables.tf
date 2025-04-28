variable "name" {
  description = "Prefix for naming"
}

variable "location" {
  description = "Azure region"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "address_space" {
  description = "CIDR block for the VNet"
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "CIDR block for the app subnet"
  default     = "10.0.1.0/24"
}
