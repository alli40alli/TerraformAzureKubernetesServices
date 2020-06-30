##### resources 

##### acr module to attach it to aks cluster later 
resource "azurerm_container_registry" "cluster_acr" {
  name                = "appaetmano"  ##### < put a unique name >
  resource_group_name = var.cluster_rg
  location            = var.cluster_location
  sku                 = "Standard"
}