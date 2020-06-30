##### the backend used to store the state file ".tfstate" in a remote storage 

/*
terraform {
  backend "azurerm" {
    resource_group_name  = "" 
    storage_account_name = "" #unique name of the created storage account
    container_name       = "" #blob container name that will contain the state file
    key                  = "web.tfstate" #the name of your choice to name the state file 
  }
}
*/