output "resource_group_name" {
  value = module.vnet.resource_group_name
}

output "aks_name" {
  value = module.aks.aks_name
}

output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "storage_account_primary_endpoint" {
  value = module.storage_account.primary_blob_endpoint
}

output "storage_account_primary_access_key" {
  value = module.storage_account.primary_access_key
  sensitive = true
}

output "fd_endpoint_cname" {
  value = module.front_door.front_door_endpoint_cname
}