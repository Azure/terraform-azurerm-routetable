resource "random_id" "rg_name" {
  byte_length = 8
}

module "routetable" {
  source              = "../../"
  resource_group_name = "${random_id.rg_name.hex}"
  location            = "${var.location}"
  route_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  route_nexthop_types = ["VnetLocal", "VnetLocal", "VnetLocal"]
  route_names        = ["route1", "route2", "route3"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}
