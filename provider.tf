terraform {
    backend "azurerm" {
        resource_group_name = "terraform-poc"
        storage_account_name ="suresh4567"
        container_name = "container2"
        key = "terraform.container2"
        access_key = "qEBHCO5lCeTY3PJ6N42PZqoqEgpWqAcUsKJTJcpY1DU5JrKQpFLEYpvSr+vCkbzvT5cO74IDtGnhua1VLUgTrg=="
    }
    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "=2.46.0"
      }
    }
    
}
provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id

}