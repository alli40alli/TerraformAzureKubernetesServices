##### resources 

#log analytics that is attached to the cluster for logging purpose 
resource "azurerm_log_analytics_workspace" "cluster_log_analytics" {
  name                = "${var.resource_prefix}-loganalytics"
  location            = var.cluster_location
  resource_group_name = var.cluster_rg
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.cluster_tags
}