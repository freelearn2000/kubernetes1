resource "azurerm_kubernetes_cluster" "my_cluster" {
  name                = "my-aks-cluster"
  location            = "West Europe"
  resource_group_name = "my-resource-group"
  dns_prefix          = "myakscluster"

  kubernetes_version = "1.22.2"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  service_principal {
    client_id     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }
    azure_policy {
      enabled = true
    }
  }

  tags = {
    Environment = "Production"
    Team        = "DevOps"
  }
}
