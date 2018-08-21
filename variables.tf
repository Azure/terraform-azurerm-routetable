variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}


variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default = "South Central US"
}

variable "route_table_name" {
  description = "The name of the RouteTable being created."
  default = "routetable"
}

variable "disable_bgp_route_propagation" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default = "true"
}
variable "route_prefixes" {
  description = "The list of address prefixes to use for each route."
  default     = ["10.0.1.0/24"]
}

variable "route_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1"]
}


variable route_nexthop_types {
    description = "The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None'"
    default = ["VnetLocal"]
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
}