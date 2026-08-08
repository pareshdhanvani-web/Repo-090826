terraform {
  required_version = ">=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgtf"
    storage_account_name = "tfstorage0107"
    container_name       = "tfcontainer"
    key                  = "Dev1907.tfstate"
  }
}
provider "azurerm" {
  features {}
}