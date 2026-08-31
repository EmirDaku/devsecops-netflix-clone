data "azurerm_resource_group" "aks-netflix-clone" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "netflix-clone" {

  name                = var.cluster_name
  location            = data.azurerm_resource_group.aks-netflix-clone.location
  resource_group_name = data.azurerm_resource_group.aks-netflix-clone.name
  dns_prefix          = "${var.cluster_name}-dns"

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
    vnet_subnet_id  = azurerm_subnet.subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
    service_cidr      = "10.1.0.0/16"
    dns_service_ip    = "10.1.0.10"
  }

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_virtual_network" "vnet" {

  name                = "${var.cluster_name}-vnet"
  address_space       = [var.vnet_address_space]
  location            = data.azurerm_resource_group.aks-netflix-clone.location
  resource_group_name = data.azurerm_resource_group.aks-netflix-clone.name
}

resource "azurerm_subnet" "subnet" {

  name                 = "${var.cluster_name}-subnet"
  resource_group_name  = data.azurerm_resource_group.aks-netflix-clone.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_container_registry" "acr" {

  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.aks-netflix-clone.name
  location            = data.azurerm_resource_group.aks-netflix-clone.location
  sku                 = "Premium"
  admin_enabled       = true
}