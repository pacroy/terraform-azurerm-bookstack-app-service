output "mysql_server" {
  value     = azurerm_mysql_server.main
  sensitive = true
}

output "service_plan" {
  value = azurerm_service_plan.main
}

output "linux_web_app" {
  value     = azurerm_linux_web_app.main
  sensitive = true
}