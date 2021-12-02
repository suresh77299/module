data "azurerm_resource_group" "terraform-poc1" {
    name = "terraform-poc"
}
data "azurerm_virtual_network" "suresh-net1" {
    name = "suresh-net"
    resource_group_name = "terraform-poc"
}
