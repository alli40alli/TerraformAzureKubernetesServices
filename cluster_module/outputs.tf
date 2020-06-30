##### outputs 
output "output_aks_rg" {
  value = azurerm_resource_group.cluster_rg.name
}
output "output_aks_id" {
  value = azurerm_kubernetes_cluster.cluster_aks.id
}

output "outout_aks_fqdn" {
  value = azurerm_kubernetes_cluster.cluster_aks.fqdn
}

output "output_aks_kube_admin_config" {
  value = azurerm_kubernetes_cluster.cluster_aks.kube_admin_config
}

output "output_aks_kube_config" {
  value = azurerm_kubernetes_cluster.cluster_aks.kube_config
}
