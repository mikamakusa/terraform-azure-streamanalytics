data "azurerm_resource_group" "this" {
  name = ""
}

data "azurerm_iothub" "this" {
  name                = ""
  resource_group_name = ""
}

data "azurerm_storage_account" "this" {
  name                = ""
  resource_group_name = ""
}

data "azurerm_storage_container" "this" {
  name                 = ""
  storage_account_name = ""
}

resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
  name               = ""
  storage_account_id = ""
}

resource "azurerm_synapse_workspace" "this" {
  location                             = ""
  name                                 = ""
  resource_group_name                  = ""
  storage_data_lake_gen2_filesystem_id = ""
}

data "azurerm_cosmosdb_account" "this" {
  name                = ""
  resource_group_name = ""
}

data "azurerm_cosmosdb_sql_database" "this" {
  account_name        = ""
  name                = ""
  resource_group_name = ""
}