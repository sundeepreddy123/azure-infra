terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  tenant_id    =  "XXXXXXXXXXXXX"
  subscription_id  =  "XXXXXXXXXXXXX"
  client_id        =  "XXXXXXXXXXXXXX"
  clientsecret     =  "XXXXXXXXXXXX"
  patner_id        =  "XXXXXXXXXXXXXXXXXXX"
}
