terraform {
    required_version=">=1.5.0"
    required_providers {
      azurerm={
        source="hasicorp/azurerm"
        version=">=4.8"
      }
    }
    backend "azurerm"{
        resource_group_name="rgtf"
        storage_account_name="tfstorage0608"
        container_name="tfcontainer"
        key="conflicttest1608.tfstate"
    }
}
provider "azurerm"{
    features{}
}