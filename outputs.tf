output "result" {
  value = {
    values = {
      host = azurerm_redis_cache.this.hostname
      port = azurerm_redis_cache.this.port
      username = ""
    }
    secrets = {
      password = azurerm_redis_cache.this.primary_access_key
    }
    // UCP resource IDs
    resources = [
        "/planes/azure/azurecloud${azurerm_redis_cache.this.id}",
    ]
  }
  description = "The result of the Recipe. Must match the target resource's schema."
  sensitive = true
}