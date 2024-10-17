variable "location" {
  description = "The Azure region to deploy resources to"
  default     = "koreacentral"
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy resources to"
  default     = "ansible-rg"
}

variable "vnet_name" {
  description = "The name of the virtual network to deploy resources to"
  default     = "ansible-vnet"
}

variable "subnet_name" {
  description = "The name of the subnet to deploy resources to"
  default     = "ansible-subnet"
}

variable "vnet_address_space" {
  description = "The address space of the virtual network to deploy resources to"
  default     = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  description = "The address prefix of the subnet to deploy resources to"
  default     = "10.0.1.0/24"
}

variable "user_name" {
  description = "The username of the admin user to deploy resources to"
  default     = "azureadmin"
}

variable "vm_size" {
  description = "The size of the virtual machine to deploy resources to"
  default     = "Standard_B1s"
}

variable "public_key_path" {
  description = "The path to the public key to deploy resources to"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "The path to the private key to deploy resources to"
  default     = "~/.ssh/id_rsa"
}
