output "mysql_host" {
  value = azurerm_mysql_server.mysql.fqdn
}

output "mysql_servername" {
  value = azurerm_mysql_server.mysql.name
}

output "mysql_admin_username" {
  value = azurerm_mysql_server.mysql.administrator_login
}

output "mysql_admin_password" {
  value = azurerm_mysql_server.mysql.administrator_login_password
}