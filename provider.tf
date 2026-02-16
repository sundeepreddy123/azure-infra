terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  tenant_id    =  var.tenant_id
  subscription_id  =  var.sub
  client_id        =  var.client
  clientsecret     =  var.client_secret
  patner_id        =  "XXXXXXXXXXXXXXXXXXX"
  feature {
    key_vault {
      purge_soft_delete_on_destroy   =  true
    }
    recovery_service_vaults  {
      recover_soft_deleted_backup_protected_vm  =  true
      }
    }
}
