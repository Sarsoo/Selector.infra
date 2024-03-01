terraform {
  backend "local" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}

locals {
  env_name = "selector-prod"
}

# resource "azurerm_resource_group" "selector" {
#   name     = local.env_name
#   location = "UK South"
# }

# module "web_service" {
#   source = "../modules/web_service"

#   resource_group_name     = azurerm_resource_group.selector.name
#   resource_group_location = azurerm_resource_group.selector.location
#   site_name               = "${local.env_name}-web"
#   service_plan_sku        = "F1"
# }

# module "data" {
#   source = "../modules/data"

#   resource_group_name     = azurerm_resource_group.selector.name
#   resource_group_location = azurerm_resource_group.selector.location
#   data_name               = "${local.env_name}-data"
# }

# module "listener_service" {
#   source = "../modules/listener_service"

#   resource_group_name     = azurerm_resource_group.selector.name
#   resource_group_location = azurerm_resource_group.selector.location
#   service_name            = "${local.env_name}-listener"
#   service_plan_sku        = "B1"
# }
