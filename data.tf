##### here we import data of created resources that are used to prepare
##### the cluster environment 


#get resource group that will contain your Azure Vault  
data "azurerm_resource_group" "security-rg" {
  name = "security-rg"  #put the name of your resource group
}

#get the key vault that will store all your secrets 
data "azurerm_key_vault" "cluster_vault" {
  name                = "web-server-key-vault"
  resource_group_name = data.azurerm_resource_group.security-rg.name
}

#get the ssh key that will be used to create the nodepool
data "azurerm_key_vault_secret" "cluster_ssh_key" {
  name         = "cluster-aks-ssh" #put your ssh key name 
  key_vault_id = data.azurerm_key_vault.cluster_vault.id
}

#get the service principal created for the AKS cluster 
data "azuread_service_principal" "cluster_sp" {
  provider     = azuread.ad
  display_name = var.cluster_sp_displayname
}

#we get the client id of the service principal assigned to the cluster
data "azurerm_key_vault_secret" "cluster_sp_client_id" {
  name         = "cluster-sp-client-id-real"  #put your client id name 
  key_vault_id = data.azurerm_key_vault.cluster_vault.id
}

#get the secret of the service principal assigned to the cluster
data "azurerm_key_vault_secret" "cluster_sp_client_secret" {
  name         = "cluster-sp-client-id" #put your client id secret name
  key_vault_id = data.azurerm_key_vault.cluster_vault.id
}
