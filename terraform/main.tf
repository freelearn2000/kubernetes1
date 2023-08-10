provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "my-aks-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "myacr"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name            = "nodepool1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size         = "Standard_DS2_v2"
  node_count      = 1
  orchestrator_version = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "example-deployment"
    labels = {
      app = "example-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "example-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "example-app"
        }
      }

      spec {
        container {
          image = "freelearn2000/chatgpt:1.0.0"  # Replace with your Docker image details
          name  = "example-container"
        }
      }
    }
  }
}
