output "virtual_netwok_id" {
  value       = data.azurerm_virtual_network.suresh-net1.id
  
}
output "vnet_address_space" {
value = data.azurerm_virtual_network.suresh-net1.address_space 
}
output "azurerm_subnet" {
    value = azurerm_subnet.websubnet1.id
}