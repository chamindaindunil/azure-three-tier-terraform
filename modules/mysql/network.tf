# Azure Private Endpoint for Azure MySQL Server
module "private_endpoint" {
    source              = "./modules/private_endpoint"
    name                = "${var.environment}-mysql"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    vnet_name           = azurerm_virtual_network.vnet.name
    subnet_name         = azurerm_subnet.subnet[0].name
    private_dns_zone_name = var.private_dns_zone_name
    private_connection_resource_id = azurerm_mysql_server.mysql.id
    subresource_names   = ["mysqlServer"]
    tags                = var.tags
}