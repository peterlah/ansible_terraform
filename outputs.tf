output "public_ip_addresses" {
  value = {
    for idx, vm in azurerm_linux_virtual_machine.vm : vm.name => azurerm_public_ip.pip[idx].ip_address
  }
  depends_on = [null_resource.wait_for_vm_setup]
}