variable "location" {}
variable "environment" {}
variable "resource_group_name" {}
variable "tags" {}

variable "mysql_version" {}
variable "mysql_sku_name" {}
variable "mysql_storage_mb" {}

variable "mysql_backup_retention_days" {
    default = 7
}
variable "mysql_geo_redundant_backup" {
    default = "Disabled"
}

variable "mysql_admin_username" {}
variable "mysql_admin_password" {}

variable "mysql_db_list" {
    type = list(object({
        name = string
    }))
}

variable "mysql_config_list" {
    type = list(object({
        name = string
        value = string
    }))
}

variable "mysql_ssl_enabled" {
    default = false
}

variable "mysql_sse_enabled" {}
variable "mysql_public_access_enabled" {}

variable "private_dns_zone_name" {
    default = "privatelink.mysql.database.azure.com"
}