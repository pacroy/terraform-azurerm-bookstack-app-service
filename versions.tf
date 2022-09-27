terraform {
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