resource "azurerm_resource_group" "this" {
  count    = length(var.resource_group) && var.resource_group_name == null
  location = lookup(var.resource_group[count.index], "location")
  name     = lookup(var.resource_group[count.index], "name")
}