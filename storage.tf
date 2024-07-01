resource "azurerm_storage_account" "this" {
  account_replication_type = ""
  account_tier             = ""
  location                 = ""
  name                     = ""
  resource_group_name      = ""
}

resource "azurerm_storage_container" "this" {
  name                 = ""
  storage_account_name = ""
}

resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
  name               = ""
  storage_account_id = ""
}