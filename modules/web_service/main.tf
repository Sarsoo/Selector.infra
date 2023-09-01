resource "azurerm_service_plan" "selector" {
  name                = var.site_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "example" {
  name                = var.site_name
  resource_group_name = var.resource_group_name
  location            = azurerm_service_plan.selector.location
  service_plan_id     = azurerm_service_plan.selector.id

  site_config {
    always_on = false
  }
}