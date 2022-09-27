module "naming" {
  source = "Azure/naming/azurerm"
  suffix = [var.suffix]
}

resource "random_password" "password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mysql_server" "main" {
  name                = module.naming.mysql_server.name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = "mysqladmin"
  administrator_login_password = random_password.password.result

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}