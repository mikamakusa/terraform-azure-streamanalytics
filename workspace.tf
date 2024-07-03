resource "azurerm_synapse_workspace" "this" {
  count                                = length(var.synapse_workspace)
  location                             = data.azurerm_resource_group.this.location
  name                                 = lookup(var.synapse_workspace[count.index], "name")
  resource_group_name                  = data.azurerm_resource_group.this.name
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.this.id
  sql_administrator_login              = sensitive(lookup(var.synapse_workspace[count.index], "sql_administrator_login"))
  sql_administrator_login_password     = sensitive(lookup(var.synapse_workspace[count.index], "sql_administrator_login_password"))
}