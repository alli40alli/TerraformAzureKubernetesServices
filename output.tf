##### root module output

output "cluster_sp_id" {
  value = data.azuread_service_principal.cluster_sp.id
}

output "output_aks_id" {
  value = module.aks.output_aks_id
}



### the outputs below are optional 
/*
output "outout_aks_fqdn" {
  value = module.aks.outout_aks_fqdn
}

output "output_aks_kube_admin_config" {
  value = module.aks.output_aks_kube_admin_config
}

output "output_aks_kube_config" {
  value = module.aks.output_aks_kube_config
}
*/

