resource "azurerm_cosmosdb_account" "this" {
  count = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.cosmosdb_account)
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location : element(
      azurerm_resource_group.this.*.location, lookup(var.cosmosdb_account[count.index], "resource_group_id")
    )
  )
  name       = lookup(var.cosmosdb_account[count.index], "name")
  offer_type = lookup(var.cosmosdb_account[count.index], "offer_type")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.cosmosdb_account[count.index], "resource_group_id")
    )
  )
}

resource "azurerm_cosmosdb_sql_database" "this" {
  count = (length(var.cosmosdb_account) && (length(var.resource_group) || var.resource_group_name != null)) == 0 ? 0 : length(var.cosmosdb_sql_database)
  account_name = try(
    var.cosmosdb_account_name != null ? data.azurerm_cosmosdb_account.this.name : element(azurerm_cosmosdb_account.this.*.name, lookup(var.cosmosdb_sql_database[count.index], "account_id"))
  )
  name = lookup(var.cosmosdb_sql_database[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.cosmosdb_sql_database[count.index], "resource_group_id")
    )
  )
}

resource "azurerm_cosmosdb_sql_container" "this" {
  count               = ((length(var.cosmosdb_account) || var.cosmosdb_account_name != null) &&
  (length(var.cosmosdb_sql_database) || var.cosmosdb_sql_database_name != null) &&
  (length(var.resource_group) || var.resource_group_name != null)) == 0 ? 0 : length(var.cosmosdb_sql_container)
  account_name        = try(
    var.cosmosdb_account_name != null ? data.azurerm_cosmosdb_account.this.name : element(
      azurerm_cosmosdb_account.this.*.name, lookup(var.cosmosdb_sql_container[count.index], "cosmosdb_account_id")
    )
  )
  database_name       = try(
      var.cosmosdb_sql_database_name != null ? data.azurerm_cosmosdb_sql_database.this.name : element(
      azurerm_cosmosdb_sql_database.this.*.name, lookup(var.cosmosdb_sql_container[count.index], "cosmosdb_database_id")
    )
  )
  name                = lookup(var.cosmosdb_sql_container[count.index], "name")
  partition_key_path  = lookup(var.cosmosdb_sql_container[count.index], "partition_key_path")
  resource_group_name = try(
      var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.cosmosdb_sql_container[count.index], "resource_group_id")
    )
  )
}