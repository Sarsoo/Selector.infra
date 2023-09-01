resource "azurerm_postgresql_server" "selector" {
  name                = var.data_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_1"
  version    = "11"
  # storage_mb = 640000

  backup_retention_days        = 7
  # geo_redundant_backup_enabled = false
  # auto_grow_enabled            = false

  # public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "selector" {
  charset             = "UTF8"
  collation           = "en-GB"
  name                = var.data_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.selector.name
}

resource "azurerm_redis_cache" "selector" {
  name                = var.data_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }
}