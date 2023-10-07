# Azure MySQL Server
resource "azurerm_mysql_server" "mysql" {
  name                = "${var.environment}-mysql"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.mysql_sku_name
  version             = var.mysql_version
  storage_mb          = var.mysql_storage_mb
  backup_retention_days = var.mysql_backup_retention_days
  geo_redundant_backup_enabled = var.mysql_geo_redundant_backup
  administrator_login = var.mysql_admin_username
  administrator_login_password = var.mysql_admin_password
  auto_grow_enabled   = true
  public_network_access_enabled = true
  ssl_enforcement_enabled = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      public_network_access_enabled,
    ]
  }

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Azure MySQL Database
resource "azurerm_mysql_database" "mysql_db" {
  count               = length(var.mysql_db_list)
  name                = "${var.environment}-mysqldb"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  depends_on = [
    azurerm_mysql_server.mysql
  ]
}

# Azure MySQL Configuration
resource "azurerm_mysql_configuration" "mysql_config" {
  count               = length(var.mysql_config_list)
  name                = var.mysql_config_list[count.index].name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql.name
  value               = var.mysql_config_list[count.index].value

  depends_on = [
    azurerm_mysql_server.mysql
  ]
}