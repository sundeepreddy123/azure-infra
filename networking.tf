variable "subscription_id" {
  description  =  "Azure subscription Id."
  type         =  string
}

variable "tenant_id" {
  description  = "Azure tenant Id."
  type         =  string
}

variable  "client_id" {
  description  = "Azure service principal application Id."
  type         = string
  default      =  null
}

variable "client_secret" {
  description    = "Azure service principal application secret."
  type           =  sring
  default        =  null
}

terrafrom {
  required_version  = "= 1.11.3"
  backend "azurerm"  {}
}

terrafrom {
  required_provider {
  azurerm = {
    version  =  "=4.27.0"
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

