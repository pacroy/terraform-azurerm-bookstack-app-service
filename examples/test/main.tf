terraform {
  cloud {}
}

provider "azurerm" {
  features {}
}

provider "random" {
}

module "bookstack_app_service" {
  source = "../.."

  resource_group_name = "rg-terraform-azurerm-bookstack-app-service"
  location            = "eastasia"
  suffix              = "partest"
}

output "mysql_sever" {
  value     = module.bookstack_app_service.mysql_server
  sensitive = true
}

output "service_plan" {
  value = module.bookstack_app_service.service_plan
}

output "linux_web_app" {
  value     = module.bookstack_app_service.linux_web_app
  sensitive = true
}