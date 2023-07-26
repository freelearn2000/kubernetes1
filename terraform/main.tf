# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "my_resource_group" {
  name     = "my-aks-rg"
  location = "East US"  # Replace with your desired Azure region
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "my_cluster" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.my_resource_group.location
  resource_group_name = azurerm_resource_group.my_resource_group.name

  dns_prefix = "my-aks-cluster"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
