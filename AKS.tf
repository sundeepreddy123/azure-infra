resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.cluster_name

  kubernetes_version = var.k8s_version

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "core"
    vm_size    = "Standard_D4s_v5"
    node_count = 2

    enable_auto_scaling = true
    min_count = 2
    max_count = 3

    node_labels = {
      "nodetype" = "core"
    }

    node_taints = [
      "nodetype=core:NoSchedule"
    ]

    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  workload_identity_enabled = true
  oidc_issuer_enabled       = true
}
