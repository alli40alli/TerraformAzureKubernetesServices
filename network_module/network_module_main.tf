##### resources

#create the vnet and the subnet that host the nodepool of the cluster 
resource "azurerm_virtual_network" "cluster_vnet" {
  name                = "${var.resource_prefix}-vnet"
  location            = var.cluster_location
  resource_group_name = var.cluster_rg
  address_space       = [var.cluster_address_space]
  tags                = var.cluster_tags
}

resource "azurerm_subnet" "cluster_subnet" {
  for_each             = var.cluster_subnets
  resource_group_name  = var.cluster_rg
  virtual_network_name = azurerm_virtual_network.cluster_vnet.name
  name                 = each.key
  address_prefix       = each.value
}




