locals {
    name = "radsql${substr(sha512(var.context.resource.id), 0, 16)}"
    merged_tags    = merge({ managed_by = "terraform" }, var.tags)
    loc_for_naming = lower(replace(var.location, " ", ""))
}

data "azurerm_client_config" "current" {}


resource "azurerm_resource_group" "this" {
  name     = "rg-${local.name}-${local.loc_for_naming}"
  location = var.location
  tags     = local.merged_tags
}


resource "azurerm_redis_cache" "this" {
  name                = "${local.name}cache"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }
}