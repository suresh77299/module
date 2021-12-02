
resource "azurerm_subnet" "websubnet1" {
    name = "websubnet1"
    virtual_network_name = data.azurerm_virtual_network.suresh-net1.name
    resource_group_name = data.azurerm_resource_group.terraform-poc1.name
    address_prefixes = ["10.70.10.0/24"]
}
resource "azurerm_network_interface" "vnet1" {
    name = "vnet-nic"
    location = data.azurerm_resource_group.terraform-poc1.location
    resource_group_name = data.azurerm_resource_group.terraform-poc1.name
    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.websubnet1.id
        private_ip_address_allocation = "Dynamic"
    }
}
    
resource "azurerm_windows_virtual_machine" "websever1" {
    name = "webserver"
    resource_group_name = data.azurerm_resource_group.terraform-poc1.name
    location = data.azurerm_resource_group.terraform-poc1.location
    size = "Standard_F2"
    admin_username = "adminuser"
    admin_password = "Suresh@456789"
    network_interface_ids = [
        azurerm_network_interface.vnet1.id
    ]
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }
}