output "result" {
  value = {
    values = {
      host = ""
      port = 0
      username = ""
    }
    secrets = {
      password = ""
    }
    // UCP resource IDs
    resources = [
        "/planes/azure/azurecloud${azurerm_redis_cache.this.id}",
    ]
  }
  description = "The result of the Recipe. Must match the target resource's schema."
  sensitive = true
}