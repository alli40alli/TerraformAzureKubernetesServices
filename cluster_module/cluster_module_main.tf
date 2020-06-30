##### resources

#create the resource group that will contain the cluster and his addons
resource "azurerm_resource_group" "cluster_rg" {
  name     = "${var.resource_prefix}-rg"
  location = var.cluster_location
  tags     = var.cluster_tags
}

#create the azure kubernetes cluster 
resource "azurerm_kubernetes_cluster" "cluster_aks" {
  name                = var.resource_prefix
  location            = var.cluster_location
  resource_group_name = azurerm_resource_group.cluster_rg.name
  ### ? ### sku_tier            = "Free"

  default_node_pool {
    name               = "nodepool1"
    vm_size            = "Standard_DS2_v2"
    availability_zones = [1, 2, 3]
    type               = "VirtualMachineScaleSets"
    node_count         = var.cluster_count
    tags               = var.cluster_tags
    vnet_subnet_id     = var.cluster_subnet_id

  }
  dns_prefix = var.cluster_dns_prefix

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }


  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.cluster_log_analytics_id
    }
  }

  kubernetes_version = "1.15.11"

  linux_profile {
    admin_username = var.cluster_username
    ssh_key {
      key_data = var.cluster_ssh ###
    }
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    load_balancer_sku  = "Standard" ##### optional
    service_cidr       = var.cluster_service_cidr
    dns_service_ip     = var.cluster_dns_service_ip
    docker_bridge_cidr = var.cluster_docker_bridge_cidr
  }


  ### ? ### private_cluster_enabled = false ##### optional 
  role_based_access_control {
    enabled = true
  }
  tags = var.cluster_tags

}

