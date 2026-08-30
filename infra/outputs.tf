output "acr_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "acr_server" {
  value = azurerm_container_registry.acr.login_server
}

output "kubectl_create_secret_command" {
  value     = "kubectl create secret docker-registry acr-secret --docker-server=${azurerm_container_registry.acr.login_server} --docker-username=${azurerm_container_registry.acr.admin_username} --docker-password=${azurerm_container_registry.acr.admin_password}"
  sensitive = true
}

#network outputs
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}