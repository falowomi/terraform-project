resource "azurerm_resource_group" "mytecloud" {
    name                        = "${var.resource-group-name}"
    location                    = "${var.location}"
}

resource "azurerm_virtual_network" "mytecloud-vnet" {
    name                        = "${var.prefix}-vnet"
    resource_group_name         = "${azurerm_resource_group.mytecloud.name}"
    location                    = "${var.location}"

    address_space               = ["10.1.0.0/16"]
}

resource "azurerm_virtual_network" "mytecloud-vnet1" {
    name                        = "${var.prefix}-vnet-2"
    resource_group_name         = "${azurerm_resource_group.mytecloud.name}"
    location                    = "${var.location}"

    address_space               = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "vnet-subnet" {
    name = "${azurerm_virtual_network.mytecloud-vnet.name}-sub1"
    resource_group_name = "${azurerm_resource_group.mytecloud.name}"
    virtual_network_name = "${azurerm_virtual_network.mytecloud-vnet.name}"
    address_prefix = "10.1.0.0/24"
}

resource "azurerm_subnet" "vnet-subnet1" {
    name = "${azurerm_virtual_network.mytecloud-vnet1.name}-sub1"
    resource_group_name = "${azurerm_resource_group.mytecloud.name}"
    virtual_network_name = "${azurerm_virtual_network.mytecloud-vnet1.name}"
    address_prefix = "10.2.0.0/24"
}

resource "azurerm_virtual_network_peering" "peer1" {
    name                        = "${azurerm_virtual_network.mytecloud-vnet.name}"
    resource_group_name         = "${azurerm_resource_group.mytecloud.name}"
    virtual_network_name        = "${azurerm_virtual_network.mytecloud-vnet1.name}"
    remote_virtual_network_id   = "${azurerm_virtual_network.mytecloud-vnet.id}"
}

resource "azurerm_virtual_network_peering" "peer2" {
    name                        = "${azurerm_virtual_network.mytecloud-vnet1.name}"
    resource_group_name         = "${azurerm_resource_group.mytecloud.name}"
    virtual_network_name        = "${azurerm_virtual_network.mytecloud-vnet.name}"
    remote_virtual_network_id   = "${azurerm_virtual_network.mytecloud-vnet1.id}"
}
