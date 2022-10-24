terraform {
  cloud {}
  required_version = "~> 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.24"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
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

output "mysql_server" {
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

output "mysql_database" {
  value = module.bookstack_app_service.mysql_database
}

output "storage_account" {
  value     = module.bookstack_app_service.storage_account
  sensitive = true
}
