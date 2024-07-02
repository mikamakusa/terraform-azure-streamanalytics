resource "azurerm_sql_server" "this" {
  count                        = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.sql_server)
  administrator_login          = sensitive(lookup(var.sql_server[count.index], "administrator_login"))
  administrator_login_password = sensitive(lookup(var.sql_server[count.index], "administrator_login_password"))
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location : element(
      azurerm_resource_group.this.*.location, lookup(var.sql_server[count.index], "resource_group_id")
    )
  )
  name = lookup(var.sql_server[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.sql_server[count.index], "resource_group_id")
    )
  )
  version = lookup(var.sql_server[count.index], "version")
}

resource "azurerm_sql_database" "this" {
  count = (length(var.sql_server) || var.sql_server_name != null) == 0 ? 0 : length(var.sql_database)
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location : element(
      azurerm_resource_group.this.*.location, lookup(var.sql_database[count.index], "resource_group_id")
    )
  )
  name = lookup(var.sql_database[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.sql_database[count.index], "resource_group_id")
    )
  )
  server_name = try(
    var.sql_server_name != null ? data.azurerm_sql_server.this.name : element(
      azurerm_sql_server.this.*.name, lookup(var.sql_database[count.index], "sql_server_id")
    )
  )
}