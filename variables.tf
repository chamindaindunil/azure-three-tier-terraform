variable "location" {}
variable "environment" {}
variable "subscription_id" {}
variable "tenant_id" {}
variable "vnet_address_space" {}
variable "subnet_list" {}
variable "nsg_list" {}
variable "nsg_rule_list" {}

variable "kubernetes_version" {
    default = "1.27.0"
    description = "The version of Kubernetes to use for the Managed Cluster."
}

variable "node_size" {
    default = "Standard_D2s_v3"
    description = "The size of the Virtual Machine."
}

variable "node_count" {
    default = 2
    description = "The number of nodes which should exist in this Node Pool."
}

variable "mysql_version" {
    default = "8.0"
    description = "The version of MySQL to use."
}

variable "mysql_sku_name" {
    default = "GP_Gen5_2"
    description = "The SKU Name for this MySQL Server."
}

variable "mysql_storage_mb" {
    default = 5120
    description = "The Storage Capacity of this MySQL Server."
}

variable "mysql_backup_retention_days" {
    default = 7
    description = "The Backup Retention Days for this MySQL Server."
}

variable "mysql_geo_redundant_backup" {
    default = "Disabled"
    description = "The Geo-Redundant Backup for this MySQL Server."
}

variable "mysql_admin_username" {
    default = "mysqladmin"
    description = "The Administrator Username for this MySQL Server."
}

variable "mysql_admin_password" {
    default = "P@ssw0rd1234!"
    description = "The Administrator Password for this MySQL Server."
}

