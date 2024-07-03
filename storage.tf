resource "azurerm_storage_account" "this" {
  count                    = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.storage_account)
  account_replication_type = lookup(var.storage_account[count.index], "account_replication_type")
  account_tier             = lookup(var.storage_account[count.index], "account_tier")
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location : element(
      azurerm_resource_group.this.*.location, lookup(var.storage_account[count.index], "resource_group_id")
    )
  )
  name = lookup(var.storage_account[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.storage_account[count.index], "resource_group_id")
    )
  )
}

resource "azurerm_storage_container" "this" {
  count = (length(var.storage_account) || var.storage_account_name != null) == 0 ? 0 : length(var.storage_container)
  name  = lookup(var.storage_container[count.index], "name")
  storage_account_name = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.name : element(
      azurerm_storage_account.this.*.name, lookup(var.storage_container[count.index], "storage_container_id")
    )
  )
}

resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
  count = (length(var.storage_account) || var.storage_account_name != null) == 0 ? 0 : length(var.data_lake_gen2_filesystem)
  name  = lookup(var.data_lake_gen2_filesystem[count.index], "name")
  storage_account_id = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.id : element(
      azurerm_storage_account.this.*.id, lookup(var.data_lake_gen2_filesystem[count.index], "storage_account_id")
    )
  )
}

resource "azurerm_storage_table" "this" {
  count = (length(var.storage_account) || var.storage_account_name != null) == 0 ? 0 : length(var.storage_table)
  name  = lookup(var.storage_table[count.index], "name")
  storage_account_name = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.name : element(
    azurerm_storage_account.this.*.name, lookup(var.storage_table[count.index], "storage_account_id"))
  )
}