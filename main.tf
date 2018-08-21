resource "azurerm_resource_group" "routetablerg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_route_table" "rtable" {
  name                          = "${var.route_table_name}"
  location                      = "${azurerm_resource_group.routetablerg.location}"
  resource_group_name           = "${azurerm_resource_group.routetablerg.name}"
  disable_bgp_route_propagation = "${var.disable_bgp_route_propagation}"
}

resource "azurerm_route" "route" {
  name                = "${var.route_names[count.index]}"
  resource_group_name = "${azurerm_resource_group.routetablerg.name}"
  route_table_name    = "${azurerm_route_table.rtable.name}"
  address_prefix      = "${var.route_prefixes[count.index]}"
  next_hop_type       = "${var.route_nexthop_types[count.index]}"
  count               = "${length(var.route_names)}"
}
