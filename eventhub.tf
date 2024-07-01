resource "azurerm_eventhub" "this" {
  count               = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.eventhub)
  message_retention   = lookup(var.eventhub[count.index], "message_retention")
  name                = lookup(var.eventhub[count.index], "name")
  namespace_name      = lookup(var.eventhub[count.index], "namespace_name")
  partition_count     = lookup(var.eventhub[count.index], "partition_count")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      azurerm_resource_group.this.*.name, lookup(var.eventhub[count.index], "resource_group_id")
    )
  )
}