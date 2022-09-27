terraform {
  cloud {
    organization = "pacroy"

    workspaces {
      name = "terraform-azurerm-bookstack-app-service"
    }
  }
}

module "bookstack_app_service" {
  source = "../.."

  resource_group_name = "rg-terraform-azurerm-bookstack-app-service"
  location            = "southeastasia"
  suffix              = "test"
}

output "mysql_sever" {
  value     = module.bookstack_app_service.mysql_server
  sensitive = true
}
