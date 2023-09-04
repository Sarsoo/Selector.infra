
output "redis_connection_string" {
  value = azurerm_redis_cache.selector.primary_connection_string
}

output "pgsql_server_fqdn" {
  value = azurerm_postgresql_server.selector.fqdn
}

output "pgsql_database_name" {
  value = azurerm_postgresql_database.selector.name
}

output "pgsql_username" {
  value = azurerm_postgresql_server.selector.administrator_login
}

output "pgsql_password" {
  value = azurerm_postgresql_server.selector.administrator_login_password
}