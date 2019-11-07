resource "azurerm_resource_group" "mytecloud" {
    name = "${var.resource-group-name}"
    location = "${var.location}"
}



resource "azurerm_virtual_network" "mytecloud-vnet" {
    name = "${var.prefix}-vnet"
    resource_group_name = "${azurerm_resource_group.mytecloud.name}"
    location = "${var.location}"

    address_space = ["10.1.0.0"]
}

resource "azurerm_subnet" "vnet-subnet" {
    name = "${azurerm_virtual_network.mytecloud-vnet.name}-sub1"
    resource_group_name = "${azurerm_resource_group.mytecloud.name}"
    virtual_network_name = "${azurerm_virtual_network.mytecloud-vnet.name}"
    address_prefix = "10.1.0.0/24"
}