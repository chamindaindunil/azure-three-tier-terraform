# Azure Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.aks_kubernetes_version
  node_resource_group = var.aks_node_resource_group
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
  sku_tier            = var.aks_sku_tier
  tags                = var.tags

  default_node_pool {
    name                = var.aks_default_node_pool_name
    node_count          = var.aks_default_node_pool_node_count
    vm_size             = var.aks_default_node_pool_vm_size
    type                = var.aks_default_node_pool_type
    os_disk_size_gb     = var.aks_default_node_pool_os_disk_size_gb
    vnet_subnet_id      = var.aks_default_node_pool_vnet_subnet_id
    max_pods            = var.aks_default_node_pool_max_pods
    orchestrator_version = var.aks_default_node_pool_orchestrator_version
    zone                = var.aks_default_node_pool_zone
    enable_auto_scaling = var.aks_default_node_pool_enable_auto_scaling
    min_count           = var.aks_default_node_pool_min_count
    max_count           = var.aks_default_node_pool_max_count
  }

  # Identity for the cluster
  identity {
    type = var.aks_identity_type
  }

  # Network Profile for the cluster
  network_profile {
    network_plugin     = var.aks_network_plugin
    network_policy     = var.aks_network_policy
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    pod_cidr           = var.aks_pod_cidr
    service_cidr       = var.aks_service_cidr
    load_balancer_sku  = var.aks_load_balancer_sku
  }

  # RBAC Profile for the cluster
  role_based_access_control {
    enabled = var.aks_role_based_access_control_enabled
  }

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_subnet.subnet,
  ]
}

# Node Pool
resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  count               = length(var.aks_node_pool_list)
  name                = var.aks_node_pool_list[count.index].name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = var.aks_node_pool_list[count.index].vm_size
  node_count          = var.aks_node_pool_list[count.index].node_count
  orchestrator_version = var.aks_node_pool_list[count.index].orchestrator_version
  os_disk_size_gb     = var.aks_node_pool_list[count.index].os_disk_size_gb
  vnet_subnet_id      = var.aks_node_pool_list[count.index].vnet_subnet_id
  max_pods            = var.aks_node_pool_list[count.index].max_pods
  type                = var.aks_node_pool_list[count.index].type
  zone                = var.aks_node_pool_list[count.index].zone
  enable_auto_scaling = var.aks_node_pool_list[count.index].enable_auto_scaling
  min_count           = var.aks_node_pool_list[count.index].min_count
  max_count           = var.aks_node_pool_list[count.index].max_count
  tags                = var.tags

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_subnet.subnet,
  ]
}
