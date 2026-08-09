terraform {
  required_version = ">=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.80.0"
    }
  }
  backend "azurerm" {

    resource_group_name  = "rgtf"
    storage_account_name = "tfstorage0608"
    container_name       = "tfcontainer"
    key                  = "Preprod0608.tfstate"

  }
}
provider "azurerm" {
  features {}
}

