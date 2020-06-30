
module "network" {
  source = "./network_module"

  cluster_location      = var.cluster_location
  cluster_rg            = module.aks.output_aks_rg
  resource_prefix       = var.resource_prefix
  cluster_address_space = var.cluster_address_space
  cluster_subnets       = var.cluster_subnets
  cluster_tags          = var.cluster_tags

}


module "aks" {
  source = "./cluster_module"

  cluster_location           = var.cluster_location
  resource_prefix            = var.resource_prefix
  cluster_dns_prefix         = var.cluster_dns_prefix
  cluster_count              = var.cluster_count
  cluster_subnet_id          = module.network.output_cluster_subnet_id
  cluster_service_cidr       = var.cluster_service_cidr
  cluster_dns_service_ip     = var.cluster_dns_service_ip
  cluster_docker_bridge_cidr = var.cluster_docker_bridge_cidr
  cluster_log_analytics_id   = module.log_analytics.output_cluster_log_analytics_id
  cluster_tags               = var.cluster_tags
  cluster_username           = var.cluster_username
  cluster_ssh                = data.azurerm_key_vault_secret.cluster_ssh_key.value
  client_id                  = data.azurerm_key_vault_secret.cluster_sp_client_id.value
  client_secret              = data.azurerm_key_vault_secret.cluster_sp_client_secret.value
}

module "acr" {

  source = "./acr_module"

  cluster_rg       = module.aks.output_aks_rg
  cluster_location = var.cluster_location
  resource_prefix  = var.resource_prefix
}

module "log_analytics" {
  source = "./log_analytics_module"

  cluster_rg       = module.aks.output_aks_rg
  cluster_location = var.cluster_location
  resource_prefix  = var.resource_prefix
  cluster_tags     = var.cluster_tags
}
