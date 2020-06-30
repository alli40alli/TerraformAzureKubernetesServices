##### provider

provider "azurerm" {
  version = "2.2.0"
  features {}
}

provider "azuread" {
  version = "0.3.1"
  alias   = "ad" 
  #you can refer whatever alias name you want but make sure it's refered when
  # creating a resource that depend of that provider
}